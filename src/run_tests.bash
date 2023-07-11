#!/bin/bash

num_tests=24
start_test=1

td=`rospack find tagslam_test`
for i in $(seq $start_test $num_tests);
do
    echo -n 'running test ' $i ' ... '
    roslaunch tagslam_test test.launch test:=$i > /dev/null &&
    python3 $td/src/compare_poses.py $td/tests/test_$i/reference.bag ~/.ros/out.bag
    if [ $? -eq 0 ]; then
       echo 'succeeded!'
       if [ $i -eq 20 ]; then
	    echo '(this test is a failure test, the scary messages are ok)'
       fi
    else
       echo 'FAILED!'
    fi
done

exit 0
