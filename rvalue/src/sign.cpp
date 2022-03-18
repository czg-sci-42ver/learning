#include <iostream>

void
fun(const int& lref) // lvalue arguments will select this
{
  std::cout << "l-value reference to const\n";
}
void
fun(int&& rref) // rvalue arguments will select this function
{
  std::cout << "r-value reference\n";
}
int
main()
{
  int x{ 5 };
  fun(x); // lvalue argument calls lvalue version of function

  int&& ref{ 5 };
  fun(ref);            // calls lvalue version of function!!! we didn't move it
  fun(std::move(ref)); // calls r-value version of function
  return 0;
}