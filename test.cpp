#include <systemc.h>

int sc_main (int argc, char * argv[])
{

   cout << "test logic" << endl;
   sc_logic u('1');
   bool b = 0;
   b = u.to_bool();

   cout << "u : "<< u << endl;
   cout << "b : "<< b << endl;

   return 0;
}

