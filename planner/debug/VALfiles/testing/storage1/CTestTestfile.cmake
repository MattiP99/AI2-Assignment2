# CMake generated Testfile for 
# Source directory: /home/matti99/popf-tif/planner/src/VALfiles/testing/storage1
# Build directory: /home/matti99/popf-tif/planner/debug/VALfiles/testing/storage1
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(storage1-action0-should-exist "/home/matti99/popf-tif/planner/debug/VALfiles/testing/insttest" "(go-out hoist0 depot0-1-1 loadarea)" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/domain.pddl" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/pfile01.pddl")
set_tests_properties(storage1-action0-should-exist PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;1;add_test;/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;0;")
add_test(storage1-action1-should-exist "/home/matti99/popf-tif/planner/debug/VALfiles/testing/insttest" "(lift hoist0 crate0 container-0-0 loadarea container0)" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/domain.pddl" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/pfile01.pddl")
set_tests_properties(storage1-action1-should-exist PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;2;add_test;/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;0;")
add_test(storage1-action2-should-exist "/home/matti99/popf-tif/planner/debug/VALfiles/testing/insttest" "(drop hoist0 crate0 depot0-1-1 loadarea depot0)" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/domain.pddl" "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/pfile01.pddl")
set_tests_properties(storage1-action2-should-exist PROPERTIES  _BACKTRACE_TRIPLES "/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;3;add_test;/home/matti99/popf-tif/planner/src/VALfiles/testing/storage1/CMakeLists.txt;0;")
