const fs = require('fs');
const AdmZip = require('adm-zip');

function getADCD(filename) {
    const match = filename.match(/^(\d+__\d+)/);
    if (match) {
//            console.log(match[1]); // 抽出されたパターンを表示します
        return match[1];
    }
}
function unzip(zipfile, extractToPath) {
    // ZIPファイルを読み込む
    const zip = new AdmZip(zipfile);

    // ZIP内のファイルリストを取得
    const zipEntries = zip.getEntries();

    // 各ファイルを解凍
    zipEntries.forEach((entry) => {
        console.log(entry.entryName); // ファイル名を表示

        if (!entry.isDirectory) {
            // ファイルを解凍
            const content = zip.readFile(entry);

            fs.mkdir(extractToPath, { recursive: true }, (err) => {
                if (err) {
                    console.error('ディレクトリの作成中にエラーが発生しました:', err);
                    return;
                }
                // 解凍したファイルを保存
                fs.writeFileSync(extractToPath + entry.entryName, content, 'binary');
            });

        }
    });
}


async function main(){
    const directoryPath = './download'; // ファイルが格納されているディレクトリパス

    let filelist = [];

    fs.readdir(directoryPath, async (err, files) => {
        if (err) {
            console.error('ディレクトリを読み込めません:', err);
            return;
        }

        files.forEach((file) => {
            if (file.endsWith('.zip')) {
                if (filelist[getADCD(file)] !== undefined) {
                    // 2023という文字列が含まれている場合
                    if (file.indexOf('2023') !== -1) {
                        filelist[getADCD(file)] = file;
                    }
                } else {
                    // 配列が空の場合はそのまま格納
                    filelist[getADCD(file)] = file;
                }
            }
        });

//    console.log(filelist);
        for (const key in filelist) {
            console.log(filelist[key]);

            // __以降の文字を抽出する
            const match = key.match(/__(.+)/);
//            console.log(match[1]);
            const kei = match[1];

            // 座標系のディレクトリへunzipする
            await unzip(
                './download/' + filelist[key],
                './extract/' + kei + '/');

        }
    });

}

main();