#include <chrono>
using namespace std::chrono;
int main() {
// Use auto keyword to avoid typing long
// type definitions to get the timepoint
// at this instant use function now()
auto start = high_resolution_clock::now();
// After function call
calc_func_process
auto stop = high_resolution_clock::now();
auto duration = duration_cast<microseconds>(stop - start);
std::cout << "runned time: " << duration.count() << std::endl;
}