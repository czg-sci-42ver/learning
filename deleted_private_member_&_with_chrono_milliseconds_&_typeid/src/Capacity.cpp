#include <chrono>
#include <cmath>
#include <cstdarg>
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <typeinfo>
namespace BT {
class test_Tree
{
public:
  test_Tree()
    : test_modify(3)
  {
  }
  test_Tree(const test_Tree&) = delete;
  test_Tree& operator=(const test_Tree&) = delete;
  int test_modify;
};
}

class BtActionServer
{
public:
  BtActionServer() {}
  BT::test_Tree& getTree() { return tree_; }

protected:
  BT::test_Tree tree_;
};

double
stddev(int count, ...)
{
  double sum = 0;
  double sum_sq = 0;
  std::va_list args;
  va_start(args, count);
  double test_1 = va_arg(args, double);
  std::cout << " czg_test " << test_1 << '\t' << std::endl;
  // va_end(args);
  double test = va_arg(args, double);
  std::cout << " czg_test " << test << '\t' << std::endl;
  for (int i = 0; i < count; ++i) {
    double num = va_arg(args, double);
    sum += num;
    sum_sq += num * num;
  }

  return std::sqrt(sum_sq / count - (sum / count) * (sum / count));
}

int
main()
{
  std::cout << stddev(3, 25.0, 27.3, 26.9, 25) << '\n';
  std::cout << stddev(3) << '\n';
  int tets = 2;
  if ((tets = 3) == 3) {
    std::cout << " czg_test " << tets << '\t' << std::endl;
  }
  BtActionServer test_server;
  const int i = 1;
  const int* i_ptr = &i;
  BT::test_Tree* A = &test_server.getTree();
  std::cout << __FUNCTION__ << " test_server.getTree() test_modify before "
            << test_server.getTree().test_modify << '\t' << std::endl;
  A->test_modify = 1;
  std::cout << __FUNCTION__ << " test_server.getTree() test_modify "
            << test_server.getTree().test_modify << '\t' << std::endl;

  using namespace std::chrono_literals;
  auto d1 = 250ms;
  int test = 200;
  std::chrono::milliseconds d3 = std::chrono::milliseconds(test);
  std::chrono::milliseconds d2 = 1s;
  std::cout << "250ms = " << d1.count() << " milliseconds\n"
            << "1s = " << d2.count()  << " "  << d3.count() << " " << typeid(test).name() << " " << typeid(uint8_t).name() << " "<<  sizeof(uint8_t) << " " << sizeof(int) << " milliseconds\n";
           
  
}