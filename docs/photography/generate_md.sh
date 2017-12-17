#!/bin/bash
FILES="$@"
for i in $FILES
do
echo "{{< photo full=\"full/$i\" thumb=\"thumb/thumb_$i\" alt=\"\" phototitle=\"\" description=\"\">}}" >> lines.md
#mv $i full/$i
#mv thumb_$i thumb/thumb_$i
done
