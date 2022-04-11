#include <exception>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#include  <cassert>
// prints the explanatory string of an exception. If the exception is nested,
// recurses to print the explanatory of the exception it holds
void
print_exception(const std::exception& e, int level = 0)
{
  std::cerr << std::string(level, ' ') << "exception: " << e.what() << '\n';
  try {
    std::rethrow_if_nested(e);
  } catch (const std::exception& nestedException) {
    print_exception(nestedException, level + 1);
  } catch (...) {
  }
}

// sample function that catches an exception and wraps it in a nested exception
void
open_file(const std::string& s)
{
  try {
    std::ifstream file(s);
    file.exceptions(std::ios_base::failbit);
  } catch (...) {
    std::throw_with_nested(std::runtime_error("Couldn't open " + s));
  }
}

// sample function that catches an exception and wraps it in a nested exception
void
run()
{
  try {
    open_file("nonexistent.file");
  } catch (...) {
    std::throw_with_nested(std::runtime_error("run() failed"));
  }
}

// runs the sample function above and prints the caught exception
int
main()
{
  int a = 1;
  int b =2;
  std::cout << " czg_test " << std::numeric_limits<float>::min() << '\t' << std::endl;

  std::cout << " czg_test " << 1/2*2 << '\t' << std::endl;
  assert(a == b && "A is not equal to B");
 
}