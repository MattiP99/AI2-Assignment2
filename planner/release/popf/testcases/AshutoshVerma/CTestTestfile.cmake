# CMake generated Testfile for 
# Source directory: /home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma
# Build directory: /home/matti99/popf-tif/planner/release/popf/testcases/AshutoshVerma
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(t3-can-be-solved "/home/matti99/popf-tif/planner/release/popf/popf2" "-I" "-D" "-c" "-v1" "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/t3-domain.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/t3-problem.pddl")
set_tests_properties(t3-can-be-solved PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/CMakeLists.txt;1;add_test;/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/CMakeLists.txt;0;")
add_test(t3-solution-could-be-found "/home/matti99/popf-tif/planner/release/popf/popf2" "-I" "-r" "-s" "-H" "-c" "-v1" "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/t3-domain.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/t3-problem.pddl" "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/t3-solution")
set_tests_properties(t3-solution-could-be-found PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/CMakeLists.txt;2;add_test;/home/matti99/popf-tif/planner/src/popf/testcases/AshutoshVerma/CMakeLists.txt;0;")
