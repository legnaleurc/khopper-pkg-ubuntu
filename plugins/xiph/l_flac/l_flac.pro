include(../../../configure.pri)

# Path setting
INC_DIRS = .	\
	$${CORE_PATH}/include
SRC_DIRS = .

INCLUDEPATH += $${INC_DIRS} $${SRC_DIRS}
DEPANDPATH  += $${INC_DIRS}

HEADERS = flacwriter.hpp
SOURCES = flacwriter.cpp

MOC_DIR = $${ROOT_PATH}/tmp/moc

# Config
CONFIG  += debug_and_release
TARGET   = kl_flac
VERSION  = $${KHOPPER_VERSION}
TEMPLATE = lib

CONFIG( debug, debug|release ) {
	DESTDIR     = $${ROOT_PATH}/build/debug
	OBJECTS_DIR = $${ROOT_PATH}/tmp/obj/debug

	unix:LIBS  += -L$${ROOT_PATH}/build/debug -lk_core
	win32:LIBS += -L$${ROOT_PATH}/build/debug -lk_core0 -lFLAC_D
} else {
	DESTDIR     = $${ROOT_PATH}/build/release
	OBJECTS_DIR = $${ROOT_PATH}/tmp/obj/release
	DEFINES    += QT_NO_DEBUG_OUTPUT

	unix:LIBS  += -L$${ROOT_PATH}/build/release -lk_core
	win32:LIBS += -L$${ROOT_PATH}/build/release -lk_core0 -lFLAC

	unix:QMAKE_POST_LINK = strip $${DESTDIR}/lib$${TARGET}.so
}

unix {
	CONFIG    += link_pkgconfig
	PKGCONFIG += flac
}
