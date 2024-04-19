#!/bin/bash
echo "Today is " `date`

cd ~

git clone https://git.eq2emu.com/devn00b/EQ2EMu.git

cd ~/EQ2EMu/EQ2/source/depends/recastnavigation/RecastDemo

./premake5 gmake

cd Build/gmake

make

cd ../../../..

git clone https://github.com/fmtlib/fmt.git

cd ~/EQ2EMu/EQ2/source/LoginServer/

make -j$(nproc)

cd ~/EQ2EMu/EQ2/source/WorldServer

make -j$(nproc)

cd ~/EQ2EMu

mkdir Linux

cd ~/EQ2EMU/Linux

cp ../EQ2/source/WorldServer/eq2world ./ && cp ../EQ2/source/LoginServer/login ./

cp -rT ../server .

ls -ltra