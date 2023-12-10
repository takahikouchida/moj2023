const pw = require('playwright');
const { performance } = require('perf_hooks');
const pagelist = require('./pagelist4.json');

console.log(pagelist);

async function getZipFile(url, path) {
    const start = performance.now();
    const browser = await pw.chromium.launch({
        headless: false,
    }); // or 'chromium', 'firefox'

    const context = await browser.newContext();
    const page = await context.newPage();
    await page.goto(url);

    let fileList = [];
    const elements  = await page.locator('ul.resource-list > li').all();
//    console.log(elements.length);
    for(let i = 0; i < elements.length; i++) {
        const text = await elements[i].locator('a.heading').getAttribute('title');
            // shp.zip で終わるものを探す
            if (text.match(/shp\.zip$/)) {
                console.log(text);

                await elements[i].locator('div > a').click();
                await page.waitForTimeout(500);
                const downloadPromise = page.waitForEvent('download');
                await elements[i].locator('div > ul > li:nth-child(2) > a').click();
//                await page.waitForTimeout(500);
                const download = await downloadPromise;
                await download.path();
                await download.saveAs("./download/" + download.suggestedFilename());
            }
    }
    await browser.close();
}

async function main() {
    for (const element of pagelist) {
        await getZipFile(element.url);
    }
}

main();

