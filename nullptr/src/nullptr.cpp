// C++ program to demonstrate
// the use of static Static
// variables in a Function
#include <iostream>
#include <ostream>
#include <string>
using namespace std;

class GfG
{
public:
  int i;
  //   static int i;

  GfG(){
    // Do nothing
  };
};
// void
// demo()
// {
//   // static variable
//   static int count = 0;
//   int test = 0;
//   test++;
//   cout << count << " \t" << test << " \n";

//   // value is updated and
//   // will be carried to next
//   // function calls
//   count++;
// }

int
main()
{
  //   for (int i = 0; i < 5; i++)
  //     demo();
  const int* test{ nullptr };

  std::cout << "test nullptr" << '\n' << test << std::endl;
  GfG obj1;
  GfG obj2;
  obj1.i = 2;
  obj2.i = 3;

  // prints value of i
  // cout << obj1.i << " " << obj2.i;
  return 0;
}