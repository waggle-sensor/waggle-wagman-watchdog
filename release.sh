#!/bin/bash -e

mkdir -p /tmp/reg

# Build the pxe-boot debian package
BASEDIR=/tmp/reg
NAME=sage-wagman-watchdog
ARCH=all

mkdir -p ${BASEDIR}/DEBIAN
cat > ${BASEDIR}/DEBIAN/control <<EOL
Package: ${NAME}
Version: ${VERSION}
Maintainer: sagecontinuum.org
Description: Starting SAGE NX Wagman Watchdog Services
Architecture: ${ARCH}
Priority: optional
EOL

cp -p deb/install/postinst ${BASEDIR}/DEBIAN/
cp -p deb/install/prerm ${BASEDIR}/DEBIAN/

cp -pr ROOTFS/* ${BASEDIR}/

dpkg-deb --root-owner-group --build ${BASEDIR} "${NAME}_${VERSION}_${ARCH}.deb"
mv *.deb /output/
