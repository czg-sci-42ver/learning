#include <algorithm>
#include <cmath>
#include <iostream>
#include <string>
#include <vector>

static inline double
normalize_angle(double angle)
{
  const double result = fmod(angle + M_PI, 2.0 * M_PI);
  // angle + M_PI is like translating the number line
  // fmod see cppreference
  double result_2 = fmod(angle + M_PI, 2.0 * M_PI);
  std::cout << " czg_test "
            << "result" << result << " " << result_2 << '\n'
            << std::endl;
  if (result <= 0.0)
    return result + M_PI;
  return result - M_PI;
}

int
main()
{
  std::cout << " czg_test " << normalize_angle(2.2 + M_PI) << '\n'
            << normalize_angle(4.2 + M_PI) << std::endl;
}