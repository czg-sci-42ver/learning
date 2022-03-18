#include <iomanip>
#include <iostream>
#include <vector>

int
main()
{
  int sz = 100;
  std::vector<int> v;

  // v.reserve(3);
  v.resize(3);
  auto cap = v.capacity();
  std::cout << "Initial size: " << v.size() << ", capacity: " << cap << '\n';
  v.clear();
  std::cout << "czg_test" << v.empty() << '\n' << std::endl;

  std::cout << "clear"
            << "Initial size: " << v.size() << ", capacity: " << cap << '\n';

  std::cout << "\nDemonstrate the capacity's growth policy."
               "\nSize:  Capacity:  Ratio:\n"
            << std::left;

  v.resize(3);
  v.at(0) = 3;
  std::cout << "czg_test" << v.at(2) << '\n' << std::endl;
  std::cout << "czg_test" << std::numeric_limits<float>::max() << '\n'
            << std::endl;
  v.shrink_to_fit();
  // while (sz-- > 0) {
  //   // v.push_back(sz);
  //   v.emplace_back(sz);
  //   if (cap != v.capacity()) {
  //     std::cout << std::setw(7) << v.size() << std::setw(11) << v.capacity()
  //               << std::setw(10) << v.capacity() / static_cast<float>(cap)
  //               << '\n';
  //     cap = v.capacity();
  //   }
  // }

  std::cout << "\nFinal size: " << v.size() << ", capacity: " << v.capacity()
            << '\n';
}