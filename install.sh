#! /bin/sh

PREFIX="/usr"
MAIN="$1/$2${PREFIX}"
CORE="$1/$3${PREFIX}"
PLUGINS="$1/$4${PREFIX}"

install -m 755 ./build/release/khopper ${MAIN}/bin
install -m 644 ./main/image/logo.svg ${MAIN}/share/pixmaps/khopper.svg
install -m 644 ./khopper.desktop ${MAIN}/share/applications

install -m 644 ./build/release/libk_core.so.0.2.1 ${CORE}/lib

install -m 644 ./build/release/plugins/*.so ${PLUGINS}/lib/khopper/plugins
