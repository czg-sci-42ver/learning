#include <cmath>
#include <cstdarg>
#include <iostream>

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
}