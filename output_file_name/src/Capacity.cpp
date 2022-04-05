#include <exception>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
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
  std::string file = __FILE__;
  unsigned char * test_char_arr;
  size_t index;
  for (index = file.size(); index > 0; index--) {
    if (file[index - 1] == '\\' || file[index - 1] == '/')
      break;
  }
  std::cout << file.substr(index) << std::endl;
  try {
    run();
  } catch (const std::exception& e) {
    print_exception(e);
  }
  std::vector<int> test;
  std::cout << " czg_test " << test.size() << " " << test.empty() << '\t'
            << std::endl;
  test.clear();
  test.reserve(2);
  std::cout << " czg_test " << test.size() << " " << test.empty() << '\t'
            << std::endl;
  std::cout << " czg_test " << (bool)(0<=1<=2) << '\t' << std::endl;
  
  
  std::cout << " czg_test " << __FUNCTION__ << '\t' << std::endl;
}