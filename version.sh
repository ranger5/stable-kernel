#!/bin/bash

#Check for dependencies
MKIMAGE=`which mkimage 2> /dev/null`
CCACHE=`which ccache 2> /dev/null`
NCURSES=`file /usr/lib/libncurses.so | grep -v ERROR 2> /dev/null`

if test "-$MKIMAGE-" = "--" || test "-$CCACHE-" = "--" || test "-$NCURSES-" = "--"
then
  echo "Need to install uboot-mkimage, ccache, and libncurses5-dev dependencies"
  sudo aptitude install uboot-mkimage ccache libncurses5-dev
fi

KERNEL_REL=2.6.32
#Stable Kernel
STABLE_PATCH=8
KERNEL_PATCH=${KERNEL_REL}.${STABLE_PATCH}
DL_PATCH=patch-${KERNEL_PATCH}
BUILD=x${STABLE_PATCH}.1

BRANCH=master
REL=v2.6.32
GIT=v2.6.32-omap1

#USB patches is board specific
BOARD=beagleboard

BUILDREV=1.0
DISTRO=cross

export KERNEL_REL BUILD RC_PATCH KERNEL_PATCH
export BRANCH REL GIT
export BOARD BUILDREV DISTRO
