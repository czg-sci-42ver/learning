// overload_date.cpp
// compile with: /EHsc
#include <iostream>
#include <vector>
using namespace std;

class Date
{
  int mo, da, yr;

public:
  Date(int m, int d, int y)
  {
    mo = m;
    da = d;
    yr = y;
  }
  friend ostream& operator<<(ostream& os, const Date& dt);
};

ostream&
operator<<(ostream& os, const Date& dt)
{
  os << dt.mo << '/' << dt.da << '/' << dt.yr;
  return os;
}

int
main()
{
  Date dt(5, 6, 92);
  int test = 9;
  cout << "dasasv sa" << test << std::endl;
  cout << dt << std::endl;
  cout << "dasasv sa" << test << std::endl;
  std::vector<int> test_vec;
  std::vector<int>* test_vec_pnt = &test_vec;
  test_vec_pnt->resize(2);
  test_vec_pnt->operator[](0) = 100;
  std::cout << __FUNCTION__ << " " << test_vec[0] << '\t' << std::endl;
}