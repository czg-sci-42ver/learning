// https://www.youtube.com/watch?v=fbYknr-HPYE&t=36s
#include <iostream>

void
set_value(const int& test)
{
  std::cout << "[r/l]" << test << std::endl;
}

void
set_value(int& test)
{
  std::cout << "[l]" << test << std::endl;
}

void
set_value(int&& test)
{
  // int k = test;
  std::cout << "[r]" << test << std::endl;
}

int
main()
{
  int i = 10;

  int& test = i;
  set_value(i);
  set_value(10); // use && / const int&
  set_value(test);
  // set_value_l(10);

  set_value(10);
  // set_value_r(i);
  std::cin.get();
}