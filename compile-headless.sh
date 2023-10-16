#!/bin/sh
#
# Compile lightweight release (Headless shell) of the Chromium browser.
#
# ATTENTION
#   This script should be executed in a supported Linux environment.
#   The build process requires 40GB of disk space and 8GB RAM
#

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

export PATH="$PWD/depot_tools:$PATH"

mkdir chromium && cd chromium && fetch --nohooks --no-history chromium

cd src && ./build/install-build-deps.sh --no-prompt && gclient runhooks

mkdir -p out/Default

echo 'import("//build/args/headless.gn")' > out/Default/args.gn
echo 'is_debug = false' >> out/Default/args.gn

gn gen out/Default

autoninja -C out/Default headless_shell

cd out/Default && tar cfz "$PWD/dist/headless_shell.tar.gz" headless_shell

echo 'Build complete'
exit 0
