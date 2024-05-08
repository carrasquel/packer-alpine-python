#!/bin/bash
# file: python-install.sh

export VERSION=3.11.0
export PYTHON_DOWNLOAD_URL=https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz

sudo apk update
sudo apk add \
    alpine-sdk ca-certificates \
    libssl1.1 gdbm readline \
    libbz2 ncurses-libs \
    sqlite-libs zlib-dev libc6-compat

wget "$PYTHON_DOWNLOAD_URL" -O python.$VERSION.tar.tgz
tar -zxvf python.$VERSION.tar.tgz

cd Python-$VERSION
./configure --enable-shared --enable-optimizations --enable-loadable-sqlite-extensions --with-ensurepip=install
make -j `nproc`
sudo make -j `nproc` install

cd ..

sudo rm -rf Python-v$VERSION
echo "Installed Python v$VERSION"
python3 --version

sudo apk add py3-setuptools
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
echo "Installed latest pip"
pip3 --version
rm "get-pip.py"

sudo ln -sf /usr/bin/python3 /usr/bin/python

sudo apk add vim vim-doc vim-tutor