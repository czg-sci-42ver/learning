// C++ program to demonstrate static
// member function in a class
#include<iostream>
using namespace std;
  
class GfG
{
   public:
      int i=25;
    // static member function
    static void printMsg()
    {
        // i=26;
        cout<<"Welcome to GfG!";
    }
};
  
// main function
int main()
{
    // invoking a static member function
    GfG::printMsg();
}