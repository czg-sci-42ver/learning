#include <cmath>
#include <cstdarg>
#include <iostream>

#include <chrono>
using namespace std::chrono;

double
stddev(int count, ...)
{
  double sum = 0;
  double sum_sq = 0;
  std::va_list args;
  va_start(args, count);
  // double test_1 = va_arg(args, double);
  // std::cout << " czg_test " << test_1 << '\t' << std::endl;
  // va_end(args);
  // double test = va_arg(args, double);
  // std::cout << " czg_test " << test << '\t' << std::endl;
  for (int i = 0; i < count; ++i) {
    double num = va_arg(args, double);
    sum += num;
    sum_sq += num * num;
  }

  return std::sqrt(sum_sq / count - (sum / count) * (sum / count));
}

int
add(int&& a, int&& b)
{
  return a + b;
}
int
add(int& a, int& b)
{
  return a + b;
}

inline int
classify_theta_rela_dist(const double& tl_theta,
                         const double& tr_theta,
                         const double& br_theta,
                         const double& bl_theta,
                         const double& target)
{
  if (target >= tl_theta || target < bl_theta) {
    return 4;
  } else if (target >= tr_theta) {
    return 1;
  } else if (target >= br_theta) {
    return 2;
  } else if (target >= bl_theta) {
    return 3;
  } else {
    return -1;
  }
}

int
main()
{
  std::cout << stddev(3, 25.0, 27.3, 26.9, 25) << '\n';
  std::cout << stddev(3) << '\n';
  int tets = 2;
  int add_a = 1;
  int add_b = 2;
  std::cout << " czg_test " << add(1, 2) << '\t' << std::endl;
  auto start = high_resolution_clock::now();
  tets = add(1, 2);
  if (tets == 3) {
    std::cout << " czg_test found tets " << tets << '\t' << std::endl;
  }
  auto stop = high_resolution_clock::now();
  auto duration = duration_cast<microseconds>(stop - start);

  // To get the value of duration use the count()
  // member function on the duration object
  std::cout << "runned time: " << duration.count() << std::endl;

  tets = 2;
  start = high_resolution_clock::now();
  if (add(1, 2) == 3) {
    std::cout << " czg_test found tets " << tets << '\t' << std::endl;
  }
  stop = high_resolution_clock::now();
  duration = duration_cast<microseconds>(stop - start);
  std::cout << "runned time: " << duration.count() << std::endl;

  start = high_resolution_clock::now();
  if (add(1, 2) == 3) {
    std::cout << " czg_test found tets " << tets << '\t' << std::endl;
  } else {
    tets = add(1, 2);
  }
  stop = high_resolution_clock::now();
  duration = duration_cast<microseconds>(stop - start);

  // To get the value of duration use the count()
  // member function on the duration object
  std::cout << "runned time: " << duration.count() << std::endl;

  start = high_resolution_clock::now();
  if (std::isnan(NAN)) {
    std::cout << " czg_test found tets " << tets << '\t' << std::endl;
  } else {
    tets = add(3, 2);
  }
  stop = high_resolution_clock::now();
  duration = duration_cast<microseconds>(stop - start);

  // To get the value of duration use the count()
  // member function on the duration object
  std::cout << "runned time: " << duration.count() << std::endl;

  int Class = 0;
  float max_posi = M_PI_2, min_posi = max_posi, target = max_posi;

  start = high_resolution_clock::now();
  if ((Class = classify_theta_rela_dist(max_posi,
                                        max_posi - M_PI / 2,
                                        min_posi + M_PI / 2,
                                        min_posi,
                                        target)) == -1) {
    std::cout << " czg_test "
              << "error" << '\t' << std::endl;
  } else {
    Class =
      classify_theta_rela_dist(
        max_posi, max_posi - M_PI / 2, min_posi + M_PI / 2, min_posi, target) -
      1;
    std::cout << " czg_test " << Class << '\t' << std::endl;
  }

  stop = high_resolution_clock::now();
  duration = duration_cast<microseconds>(stop - start);

  // To get the value of duration use the count()
  // member function on the duration object
  std::cout << "runned time: " << duration.count() << std::endl;
  
  start = high_resolution_clock::now();
  if ((Class = classify_theta_rela_dist(max_posi,
                                        max_posi - M_PI / 2,
                                        min_posi + M_PI / 2,
                                        min_posi,
                                        target)-1) == -2) {
    std::cout << " czg_test "
              << "error" << '\t' << std::endl;
  
    std::cout << " czg_test " << Class << '\t' << std::endl;
  }

  stop = high_resolution_clock::now();
  duration = duration_cast<microseconds>(stop - start);

  // To get the value of duration use the count()
  // member function on the duration object
  std::cout << "runned time: " << duration.count() << std::endl;
}