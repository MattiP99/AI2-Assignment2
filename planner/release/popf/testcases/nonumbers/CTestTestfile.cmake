# CMake generated Testfile for 
# Source directory: /home/matti99/popf-tif/planner/src/popf/testcases/nonumbers
# Build directory: /home/matti99/popf-tif/planner/release/popf/testcases/nonumbers
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(no-num-satellite-cts-plan-reachable "/home/matti99/popf-tif/planner/release/popf/popf2" "-H" "-r" "-s" "-I" "-D" "-c" "-gnonumbers" "-v1" "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/satellite-cts-domain.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/satellite-cts-problem-01.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/satellite-cts-plan-01")
set_tests_properties(no-num-satellite-cts-plan-reachable PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/CMakeLists.txt;1;add_test;/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/CMakeLists.txt;0;")
add_test(no-num-satellite-cts-can-be-solved "/home/matti99/popf-tif/planner/release/popf/popf2" "-I" "-D" "-c" "-gnonumbers" "-v1" "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/satellite-cts-domain.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/satellite-cts-problem-01.pddl")
set_tests_properties(no-num-satellite-cts-can-be-solved PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/CMakeLists.txt;2;add_test;/home/matti99/popf-tif/planner/src/popf/testcases/nonumbers/CMakeLists.txt;0;")
