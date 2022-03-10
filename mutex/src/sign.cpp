#include <iostream>
#include <mutex>
#include <thread>

class test_mutex
{
public:
  int g_i = 0;
  std::mutex czg_g_i_mutex; // protects g_i
  void safe_increment();
  std::thread member1Thread()
  {
    return std::thread(&test_mutex::safe_increment, this);
  };
  void init()
  {
    int temp = 2;
    test_i = static_cast<const int*>(&temp);
    std::cout << "czg_test" << *test_i << '\n' << std::endl;
  }

private:
  const int* test_i;
};

void
test_mutex::safe_increment()
{
  const std::lock_guard<std::mutex> lock(czg_g_i_mutex);
  ++g_i;

  std::cout << "g_i: " << g_i << "; in thread #" << std::this_thread::get_id()
            << '\n';

  // g_i_mutex is automatically released when lock
  // goes out of scope
}

int
main()
{
  test_mutex test;
  test.init();
  // std::cout << "czg_test" << test. << '\n' << std::endl;
  // test_mutex*

  std::cout << "g_i: " << test.g_i << "; in main()\n";

  std::thread t1 = test.member1Thread();
  std::thread t2 = test.member1Thread();

  t1.join();
  t2.join();

  std::cout << "g_i: " << test.g_i << "; in main()\n";
}