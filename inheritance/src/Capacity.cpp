#include <iostream>
// #include <conio.h>

using namespace std;

class Base
{
public:
    int b;
    void Display()
    {
        cout<<"Base: Non-virtual display."<<endl;
    };
    virtual void vDisplay()
    {
        cout<<"Base: Virtual display."<<endl;
    };
};

class Derived : public Base
{
public:
    int d;
    void Display()
    {
        cout<<"Derived: Non-virtual display."<<endl;
    };
    virtual void vDisplay()
    {
        cout<<"Derived: Virtual display."<<endl;
    };
};

int main()
{
    Base ba;
    Derived de;

    ba.Display();
    ba.vDisplay();
    de.Display();
    de.vDisplay();

    // _getch();
    return 0;
};