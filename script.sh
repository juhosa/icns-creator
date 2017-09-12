#!/bin/bash

sizes=(16 32 128 256 512)
filename=$1
dest="/tmp/icns-creator/tmp_ics.iconset"
mkdir -p $dest

for s in "${sizes[@]}"
do
	size=$s"x"$s
	double=$(($s*2))
	double_size=$double"x"$double
	echo "Creating "$size" and "$size"@2x ..."
	# echo $double
	convert $filename -resize $size $dest/icon_$size@1x.png
	convert $filename -resize $double_size $dest/icon_$size@2x.png
done

iconutil -c icns -o icon.icns $dest

rm -rf $dest
