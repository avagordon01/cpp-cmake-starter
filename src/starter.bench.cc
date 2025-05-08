#include <benchmark/benchmark.h>

#include <iostream>

namespace {
void BM_SomeFunction(benchmark::State& state) {
    // Perform setup here
    for (auto _: state) {
        (void)_;
        // This code gets timed
        std::cout << "0";
    }
}
} //namespace
// Register the function as a benchmark
BENCHMARK(BM_SomeFunction);
// Run the benchmark
BENCHMARK_MAIN();
