add_executable(starter-benchmark starter.bench.cc)
target_link_libraries(starter-benchmark PRIVATE benchmark::benchmark)
add_test(starter-benchmark starter-benchmark)

add_executable(starter-test starter.test.cc)
target_link_libraries(starter-test PRIVATE GTest::gtest_main)
gtest_discover_tests(starter-test)

add_executable(starter starter.cc)
add_test(starter starter)
install(TARGETS starter)
