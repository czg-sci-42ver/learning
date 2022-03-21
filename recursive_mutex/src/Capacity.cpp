#include <iostream>
#include <mutex>
#include <thread>
#define METHOD 1

class X
{
#if METHOD == 1
  std::recursive_mutex m;
#else
  std::mutex m;
#endif

  std::string shared;

public:
  void fun1()
  {
#if METHOD == 1
    std::lock_guard<std::recursive_mutex> lk(m);
#else
    std::lock_guard<std::mutex> lk(m);
#endif

    shared = "fun1";
    std::cout << "in fun1, shared variable is now " << shared << '\n';
  }
  void fun2()
  {
#if METHOD == 1
    std::lock_guard<std::recursive_mutex> lk(m);
#else
    std::lock_guard<std::mutex> lk(m);
#endif
    shared = "fun2";
    std::cout << "in fun2, shared variable is now " << shared << '\n';
    fun1(); // recursive lock becomes useful here
    std::cout << "back in fun2, shared variable is " << shared << '\n';
  };
};

int
main()
{
  X x;
  std::thread t1(&X::fun1, &x);
  std::thread t2(&X::fun2, &x);
  t1.join();
  t2.join();
}