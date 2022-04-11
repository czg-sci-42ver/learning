// #include "../include/sign.h" // namespace Color
#include <iostream>
using namespace std;
int
main()
{
  // Color::Modifier red(Color::FG_RED);
  // Color::Modifier def(Color::FG_DEFAULT);
  // cout << "This ->" << red << "\033[1;32m" <<" self pose " << "word" << def << "<- is red." << endl;
  std::cout << __FUNCTION__ << " czg_test "
                    << "\033[1;32m" << " self pose " << " " << "\033[1;39m" << "\n"
                    << "\033[1;31m" <<" enemy.id() "
                    << " " << "\033[1;39m"
                    << " enemy pose " 
                    << " " << '\n'
                    << std::endl;
}