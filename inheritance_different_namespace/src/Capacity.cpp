#include <algorithm>
#include <iostream>
 
namespace a
{
class A1 {
    int test =4;
 public:
    void testA1() {std::cout << " czg_test " << test << '\n' << std::endl;}
    friend std::ostream& operator<< (std::ostream& os, A1 const& a) {
        return os << "A::id=" << a.test;
    }
};
}

namespace b
{
class B1: public a::A1
{
 public:
    void testB1()
        {
          a::A1::testA1();
        }
};
}

 
int main()
{
    b::B1 test;
    test.testB1();
    std::cout << " czg_test " << test << '\n' << std::endl;
}