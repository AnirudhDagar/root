#Many special rules for different platforms
if(CMAKE_C_COMPILER MATCHES kcc)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  #LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/kccstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif3.cxx)
else(CMAKE_C_COMPILER MATCHES kcc)
  if(ROOT_PLATFORM MATCHES "linux")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "linux")
  if(ROOT_PLATFORM MATCHES "hurd")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "hurd")
  if(ROOT_PLATFORM MATCHES "fbsd")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "fbsd")
  if(ROOT_PLATFORM MATCHES "obsd")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "obsd")
  if(ROOT_PLATFORM MATCHES "hpux")
    if(ROOT_ARCHITECTURE MATCHES "hpuxia64acc")
      LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
      #LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/accstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif3.cxx)
    endif(ROOT_ARCHITECTURE MATCHES "hpuxia64acc")    
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "hpux")
  if(ROOT_PLATFORM MATCHES "solaris")
    if(ROOT_ARCHITECTURE MATCHES "suncc5")
      LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
      #LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif3.cxx)
      if(CXXFLAGS MATCHES stlport4)
        LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/sunstrm.cxx)
      else()
        LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/stlport4strm.cxx)
      endif()
    endif(ROOT_ARCHITECTURE MATCHES "suncc5")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "solaris")
  if(ROOT_PLATFORM MATCHES "aix3")
    LIST(APPEND CINT_C_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dlfcn.c)  
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "aix3")
  if(ROOT_PLATFORM MATCHES "aix")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "aix")
  if(ROOT_PLATFORM MATCHES "aix5")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "aix5")
  if(ROOT_PLATFORM MATCHES "sgi")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "sgi")
  if(ROOT_PLATFORM MATCHES "alpha")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/alphastrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "alpha")
  if(ROOT_PLATFORM MATCHES "alphagcc")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "alphagcc")
endif(CMAKE_C_COMPILER MATCHES kcc)

if(ROOT_PLATFORM MATCHES "sunos")
    LIST(APPEND CINT_C_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/sunos.c)  
endif(ROOT_PLATFORM MATCHES "sunos")

if(ROOT_PLATFORM MATCHES "macos")
  if(ROOT_PLATFORM MATCHES "macosx")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx)  
  else(ROOT_PLATFORM MATCHES "macosx")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/macos.cxx 
         ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/fakestrm.cxx)  
  endif(ROOT_PLATFORM MATCHES "macosx")
endif(ROOT_PLATFORM MATCHES "macos")


if(ROOT_PLATFORM MATCHES "lynxos")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/fakestrm.cxx)  
endif(ROOT_PLATFORM MATCHES "lynxos")
if(ROOT_PLATFORM MATCHES "win32")
    LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
    #LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/winnt.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif3.cxx)
    #TODO check compiler version  
endif(ROOT_PLATFORM MATCHES "win32")
if(ROOT_PLATFORM MATCHES "vms")
    LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/fakestrm.cxx)  
endif(ROOT_PLATFORM MATCHES "vms")

if(CMAKE_CXX_COMPILER_ID MATCHES Intel)
    list(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
    if(ICC_MAJOR GREATER 8)
      if(ICC_MAJOR GREATER 10)
        list(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc4strm.cxx)
      else()
        list(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc3strm.cxx)
      endif()
    else()
      list(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/iccstrm.cxx)
    endif()
endif()

IF(${GCC_MAJOR} EQUAL 3)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc3strm.cxx)
ENDIF(${GCC_MAJOR} EQUAL 3)

IF(${GCC_MAJOR} EQUAL 4)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc4strm.cxx)
ENDIF(${GCC_MAJOR} EQUAL 4)

IF(${CLANG_MAJOR} EQUAL 2)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc4strm.cxx)
ENDIF(${CLANG_MAJOR} EQUAL 2)

IF(${CLANG_MAJOR} EQUAL 3)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc4strm.cxx)
ENDIF()

IF(USING_LIBCXX)
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc4strm.cxx )
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libcxxstrm.cxx)
ENDIF()


if (CMAKE_C_COMPILER MATCHES "xlC")
  LIST(REMOVE_ITEM CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/libstrm.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif.cxx)
  LIST(APPEND CINT_CXX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/longif3.cxx ${CMAKE_CURRENT_SOURCE_DIR}/src/dict/gcc3strm.cxx)
endif (CMAKE_C_COMPILER MATCHES "xlC")
