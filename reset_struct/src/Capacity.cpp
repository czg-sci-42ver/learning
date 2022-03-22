#include <functional>
#include <iostream>
#include <vector>
 
enum Method{
  POINT_TO_POINT,
  POINT_TO_LINE,
  UNSET,
  ZERO
};
// obstacle id，point id , distance
typedef struct obstacle
{
  int obstacle_id; 
  // -2:unset; -3:zero; -1:calc error; 0-3:id
  int point_id; // 5: indicate center
  double dist = std::numeric_limits<double>::max();
  Method method_;// some enum
  friend std::ostream& operator<<(std::ostream& os,const obstacle& dt)
{
    if (&os == &std::cout) {
        return os << "dist: " <<  dt.dist<< ", method_: " << dt.method_ ; 
  
}
    
}
} obstacle_info;
 
int main()
{
    obstacle_info test_struct;
    test_struct.method_ = UNSET;
    std::ostream& test_os= std::cout << " czg_test ";
    test_os << test_struct << '\n' << std::endl;
    test_struct = obstacle_info();
    std::cout << " czg_test " << test_struct << '\n' << std::endl;
}