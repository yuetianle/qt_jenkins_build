#!/usr/bin/env bash
cd /root/ext_lib/
echo -e "build cmake --------------"
tar -zxvf cmake-3.8.2.tar.gz
cd cmake-3.8.2
./configure && make install
cd ..
echo -e "build log4cpp ------------"
tar -zxvf log4cpp-1.2-zhbr.tar.gz
cd log4cpp-1.2-zhbr
./configure && make install
cd ..
echo -e "build static boost ------------"
tar -zxvf boost_1_73_0.tar.gz
cd boost_1_73_0
./bootstrap.sh
./b2 install --prefix=/usr/local cxxflags='-fPIC' cflags='-fPIC' toolset=gcc link=static runtime-link=shared threading=multi --with-filesystem --with-iostreams --with-regex --with-serialization --with-system --with-date_time --with-locale address-model=64
cd ..
echo -e "build qt ---------"
tar -zxvf qt-everywhere-opensource-src-4.8.4.tar.gz
cd qt-everywhere-opensource-src-4.8.4
./configure && make install echo "export QTDIR=/usr/local/Trolltech/Qt-4.8.4\r\n export PATH=$QTDIR/bin:$PATH\r\n export MANPATH=$QTDIR/man:$MANPAT \r\n export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH" >> .bash_profile && source .bash_profile
echo -e "build fininshed!!!!"

rm -rf /root/ext_lib/*

