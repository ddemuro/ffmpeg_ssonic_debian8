#!/bin/bash

echo "Should we add deb-multimedia to your sources.list?"
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "deb http://www.deb-multimedia.org squeeze main non-free" > /etc/apt/sources.list
    echo "deb http://www.deb-multimedia.org squeeze-backports main" > /etc/apt/sources.list
else
    echo "I trust you know what you're doing..."
fi

echo "Updating list"

apt-get update

echo "Installing requirements, please wait..."
apt-get install build-essential subversion git-core yasm libgpac-dev libdirac-dev libgsm1-dev libschroedinger-dev libspeex-dev libvorbis-dev libopenjpeg-dev libdc1394-22-dev libsdl1.2-dev zlib1g-dev texi2html libfaac-dev libfaad-dev libmp3lame-dev libtheora-dev libxvidcore4-dev libopencore-amrnb-dev libopencore-amrwb-dev libvpx-dev libfreetype6-dev frei0r-plugins-dev librtmp-dev libaacplus-dev libx264-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev

echo "Cloning x264"
#git clone git://git.videolan.org/x264.git
cd x264
./configure --enable-shared
make
make install
cd ..

echo "Cloning xavs"
#svn co https://xavs.svn.sourceforge.net/svnroot/xavs/trunk xavs
cd xavs
./configure --enable-shared --disable-asm
make
make install
cd ..

echo "Cloning ffmpeg"
#git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
./configure --enable-shared --enable-libx264 --enable-gpl
make
make install

make tools/qt-faststart
make install tools/qt-faststart

cd ../x264
make distclean
./configure --enable-static
make
make install

echo "All done!"
