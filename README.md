# 登記所備付地図　をダウンロードおよびPostGISへ格納します

- １．ダウンロード手順
  ※voltaがインストール済である事
  ※Windows11で実行を確認
  ※ブラウザが起動し自動ダウンロードされる


    cd download
    npm install
    npx playwright install
    node main1.js
    node main2.js
    node main3.js
    node main4.js

    ダウンロードが完了すると　download　フォルダの中に　zipファイルが格納される
    すべてのダウンロードが完了後に次を実行

    node unzip.js

    extract　フォルダの中に　系ごとフォルダ分けされシェープファイルが格納される

- ２．PostGIS格納
　　※Linuxで実行


    cd shp2psql
    ./shp2pgsql.sh

    shファイルのDB接続先やDB名は適宜変更


- ３．都道府県ポリゴン
 

    都道府県ポリゴンを以下よりダウンロードする
    https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-N03-v3_1.html
    N03-20230101_GML.zip   

    次のコマンドでPostGISへ格納
    shp2pgsql -a -W cp932 -i -D -s 4326 N03-23_230101.shp N03-23_230101 | psql -U postgres -d moj2023

    
      

- ４．データ加工

　　位置のおかしいポリゴンを除去する(都道府県ポリゴンからはみ出た地番は削除する)
　　小縮尺用に市区町村別にポリゴンをまとめたビューを作成（moj2023_mini）
    

    次のSQLをDBで実行
    sql/query.sql    




  
