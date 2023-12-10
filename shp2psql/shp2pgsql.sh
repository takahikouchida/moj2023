for file in `find ../download/download/1 -type f -name *.shp`; do
	shp2pgsql -s 2443:3857 -W cp932 -p -I $file moj2023 | psql -U postgres -d $1
	break;
done

for file in `find ../download/download/1 -type f -name *.shp`; do
	shp2pgsql -s 2443:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/2 -type f -name *.shp`; do
	shp2pgsql -s 2444:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/3 -type f -name *.shp`; do
	shp2pgsql -s 2445:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/4 -type f -name *.shp`; do
	shp2pgsql -s 2446:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/5 -type f -name *.shp`; do
	shp2pgsql -s 2447:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/6 -type f -name *.shp`; do
	shp2pgsql -s 2448:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/7 -type f -name *.shp`; do
	shp2pgsql -s 2449:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/8 -type f -name *.shp`; do
	shp2pgsql -s 2450:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/9 -type f -name *.shp`; do
	shp2pgsql -s 2451:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/10 -type f -name *.shp`; do
	shp2pgsql -s 2452:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/11 -type f -name *.shp`; do
	shp2pgsql -s 2453:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/12 -type f -name *.shp`; do
	shp2pgsql -s 2454:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/13 -type f -name *.shp`; do
	shp2pgsql -s 2455:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/14 -type f -name *.shp`; do
	shp2pgsql -s 2456:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/15 -type f -name *.shp`; do
	shp2pgsql -s 2457:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done

for file in `find ../download/download/16 -type f -name *.shp`; do
	shp2pgsql -s 2458:3857 -W cp932 -a  $file moj2023 | psql -U postgres -d $1
done
