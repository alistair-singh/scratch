
#pragma once

#ifdef WIN32
  #define DllExport   __declspec( dllexport ) 
#else
  #define DllExport   
#endif

namespace file {

DllExport void file();

}
