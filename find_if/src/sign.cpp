#include <algorithm>
#include <cstdio>
#include <iostream>
#include <iterator>
#include <vector>

int
main()
{
  if (1 < 2) {
    std::printf("haha");
#ifdef DEBUG_CALC_TEB
    RCLCPP_INFO(rclcpp::get_logger("11teb_calc"),
                "iter_obstacle size %zu\n",
                iter_obstacle->size());
#endif
  }

  std::vector<int> v{ 1, 2, 3, 4 };
  int n1 = 3;
  int n2 = 5;
  auto is_even = [](int i) { return i % 2 == 0; };

  auto result1 = std::find(begin(v), end(v), n1);
  auto result2 = std::find(begin(v), end(v), n2);

  std::vector<int> test{ 1, 3 };
  auto result3 = std::find_if(begin(test), end(test), is_even);

  (result1 != std::end(v)) ? std::cout << "v contains " << n1 << '\n'
                           : std::cout << "v does not contain " << n1 << '\n';

  (result2 != std::end(v)) ? std::cout << "v contains " << n2 << '\n'
                           : std::cout << "v does not contain " << n2 << '\n';
  std::cout << *std::end(v) << '\n';
  std::cout << *result2 << '\n';
  std::cout << *std::end(v) << '\n';
  std::cout << *result1 << '\n';
  std::cout << *std::end(test) << '\n';
  std::cout << *result3 << '\n';

  (result3 != std::end(test))
    ? std::cout << "v contains an even number: " << *result3 << '\n'
    : std::cout << "v does not contain even numbers\n";
}