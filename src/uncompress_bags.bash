#!/bin/bash

num_tests=24
start_test=1

td=`rospack find tagslam_test`
for i in $(seq $start_test $num_tests);
do
    cd `rospack find tagslam_test`/tests/test_$i
    for f in tag_detections.bag.bz2 reference.bag.bz2;
    do
	if [[ -f "$f" ]]; then
	    bunzip2 $f
	    echo 'uncompressing: ' $i '/' $f
	else
	    echo '     skipping: ' $i '/' $f
	fi
    done
done

exit 0
