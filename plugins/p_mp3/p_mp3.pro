include(../../configure.pri)

# Path setting
INC_DIRS = .	\
	$${CORE_PATH}/include
SRC_DIRS = .

INCLUDEPATH += $${INC_DIRS} $${SRC_DIRS}
DEPANDPATH  += $${INC_DIRS}

HEADERS = mp3panel.hpp mp3writer.hpp
SOURCES = mp3panel.cpp mp3writer.cpp

MOC_DIR = $${ROOT_PATH}/tmp/moc

# Config
CONFIG  += plugin debug_and_release
TARGET   = $$qtLibraryTarget(kpp_mp3)
VERSION  = $${KHOPPER_VERSION}
TEMPLATE = lib

CONFIG( debug, debug|release ) {
	DESTDIR     = $${ROOT_PATH}/build/debug/plugins
	OBJECTS_DIR = $${ROOT_PATH}/tmp/obj/debug

	unix:LIBS  += -L$${ROOT_PATH}/build/debug -lk_core -lmp3lame
	win32:LIBS += -L$${ROOT_PATH}/build/debug -lk_core0 -lmp3lame_D -ltagd
} else {
	DESTDIR     = $${ROOT_PATH}/build/release/plugins
	OBJECTS_DIR = $${ROOT_PATH}/tmp/obj/release
	DEFINES    += QT_NO_DEBUG_OUTPUT

	unix:LIBS  += -L$${ROOT_PATH}/build/release -lk_core -lmp3lame
	win32:LIBS += -L$${ROOT_PATH}/build/release -lk_core0 -lmp3lame -ltag

	unix:QMAKE_POST_LINK = strip $${DESTDIR}/lib$${TARGET}.so
}

unix {
	CONFIG    += link_pkgconfig
	PKGCONFIG += taglib
}
