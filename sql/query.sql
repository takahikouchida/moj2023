-- "市町村c" に対しインデックスを貼る
create index idx_市町村c on moj2023("市町村c");

-- n03_007 に対しインデックスを貼る
create index idx_n03_007 on "n03-23_230101"(n03_007);

-- 都道府県ポリゴンを囲うポリゴンを生成
create materialized view "pref_pygon_ConvexHull" as
select
    left(n03_007, 2) as code,
    n03_001 as name,
    st_transform(ST_ConvexHull(st_union(ST_Buffer(geom, 0.00001))),3857) as geom
from
    "n03-23_230101"
group by left(n03_007, 2),n03_001
;

-- 都道府県ポリゴンからはみ出したレコードを削除する
delete from moj2023 where
    ST_Disjoint(geom, (select geom from "pref_pygon_ConvexHull"
                       where code = left("市町村c",2)));

-- 小縮尺用のポリゴンを作成する。市区町村ごとにレコードをまとめる
create materialized view moj2023_mini as
select
    "市町村c" ,"市町村名",
    st_simplify(st_union(ST_Buffer(geom, 10)), 0.3) as geom from moj2023
group by "市町村c" , "市町村名"
;
