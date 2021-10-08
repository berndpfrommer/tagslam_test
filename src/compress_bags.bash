#!/bin/bash

num_tests=24
start_test=1

td=`rospack find tagslam_test`
for i in $(seq $start_test $num_tests);
do
    echo 'uncompressing test ' $i ' ... '
    cd `rospack find tagslam_test`/tests/test_$i
    for f in tag_detections.bag reference.bag;
    do
	if [[ -f "$f" ]]; then
	    lbzip2 $f
	    echo 'compressing: ' $i '/' $f
	else
	    echo '   skipping: ' $i '/' $f
	fi
    done
done

exit 0
