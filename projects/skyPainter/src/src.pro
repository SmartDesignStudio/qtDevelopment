QT += widgets
TEMPLATE = app
TARGET = skyPainter

######################################################  DEFINES
DEFINES += NOMINMAX
contains(DEFINES,TOUCHSTYLE)|contains(DEFINES,MOUSESTYLE){
message("Style was config by build Script...........")
}else {
DEFINES += TOUCHSTYLE
DEFINES += MOUSESTYLE
}
DEFINES += JAVERIFICATION
######################################################  CONFIG
CONFIG -= debug_and_release_target
CONFIG -= debug_and_release
CONFIG(release, debug|release) {
    message("Release build!" )
   }
CONFIG(debug, release|debug) {
    message("Debug build!" )
}
OBJECTS_DIR = .obj
MOC_DIR = .moc
######################################################   checking INCLUDE FILES
isEmpty(PROJECT_ROOT):PROJECT_ROOT=$$clean_path($$PWD/../../../)

INCLUDEPATH += . \
               $$PROJECT_ROOT/headers/include

include(main.pri)

contains( DEFINES, LINUXFLYSTYLE ) {
    message("Build mouse painter style" )
    include(mousestyle.pri)
}

contains( DEFINES, LINUXTOUCHSTYLE ) {
    message("touch painter style" )
    include(touchstyle.pri)
}



######################################################  checking compiler
equals(QMAKE_COMPILER,msvc) {
    message("Using Microsoft MSVC compiler!" )
    QMAKE_CXXFLAGS += -WX
}

equals(QMAKE_COMPILER,gcc) {
    message("Using GNU GCC compiler!" )
    QMAKE_CXXFLAGS += -Werror
}
######################################################  checking host platforms

VERSION =  0.0.0
VERSION = $$cat($$PWD/VERSION)
#-----------------------------------------------------
VERSTR = '\\"$${VERSION}\\"'  # place quotes around the version string
DEFINES += VER=\"$${VERSTR}\" # create a VER macro containing the version string
message("Building app in version: $${VERSION}")
TARGET =$${TARGET}_$$VERSION


###################################################### checking target platforms

unix{
   message("Host OS is Unix/Linux !")
   MACH = unknow
   equals(QMAKE_COMPILER,gcc):  MACH = $$system($$QMAKE_CXX -dumpmachine)
#----------------------------------------------------------------target os is linux
   message("Target OS is Linux !")
   DESTDIR = $$PROJECT_ROOT/plat-linux/pc/bin
    message("march=$$MACH")

    CONFIG(release, debug|release) {
       LIBS +=
    }

    CONFIG(debug, release|debug) {
       LIBS +=
    }

    #+++++++++++++++++++++++++++++++++++++++++++++ target to linux on x86 PC
    contains( MACH, ((.)*)86-((.)*) ) {
        message("Target Machine is x86 PC !!!")

        LIBS += -L"$$PROJECT_ROOT/plat-linux/lib"
    }else : contains( MACH, (^arm)-linux-((.)*) ) {
    #+++++++++++++++++++++++++++++++++++++++++++++ target to linux on ARM
        message("Target Machine is ARM embedded system !!!")
        LIBS += -L"$$PROJECT_ROOT/plat-linux/lib"
        DESTDIR = $$PROJECT_ROOT/plat-linux/bin
    } else {
      error("******************Unknow Target Platform !!!")
    }
}

 win32{
   message("Host OS is Windows !")
#----------------------------------------------------------------target os is windows
    contains(QMAKE_PLATFORM,win32 ) {
        message("Target OS is Win32!")
        DESTDIR =  $$PROJECT_ROOT/plat-win32/run_env/
        LIBS += -L"$$PROJECT_ROOT/plat-win32/lib"

        CONFIG(release, debug|release) {
           LIBS +=
           }
        CONFIG(debug, release|debug) {
           LIBS +=
           }
        contains(QMAKE_TARGET.arch,x86) {
            message("Target Machine is x86 !!!")

        } else {
            contains(QMAKE_TARGET.arch,x86_64) {
            message("Target Machine is x86_64 !!!")
            }
        }
    }else {
    #----------------------------------------------------------------target os is unknow
      error("******************Unknow Target Platform !!!")
    }
}


#####################################################    translation

TRANSLATIONS = skypainter_zh_CN.ts \
               skypainter_zh_TW.ts \
               skypainter_en.ts
