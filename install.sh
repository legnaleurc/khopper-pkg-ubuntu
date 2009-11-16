#! /bin/sh

PREFIX="usr"
MAIN="$1/khopper/${PREFIX}"
CORE="$1/libkhopper-core/${PREFIX}"
PLUGINS="$1/khopper-plugins/${PREFIX}"

install -m 755 ./build/release/khopper ${MAIN}/bin
install -m 644 ./main/image/logo.svg ${MAIN}/share/pixmaps/khopper.svg
install -m 644 ./khopper.desktop ${MAIN}/share/applications

install -m 644 ./build/release/libk_core.so.0.2.3 ${CORE}/lib
install -m 644 ./build/release/libkl_flac.so.0.2.3 ${CORE}/lib

install -m 644 ./build/release/plugins/*.so ${PLUGINS}/lib/khopper/plugins
