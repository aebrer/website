#!/bin/bash
FILES="$@"
for i in $FILES
do
echo "Prcoessing image $i ..."
/usr/bin/convert -thumbnail 500 $i thumb_$i
done
