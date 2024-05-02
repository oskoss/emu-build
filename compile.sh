#!/bin/bash
set -eux

echo "Today is " `date -u --date=@1404372514`

cd /workspace/EQ2EMu/EQ2/source/depends/recastnavigation/RecastDemo

curl -OL https://github.com/premake/premake-core/releases/download/v5.0.0-beta2/premake-5.0.0-beta2-linux.tar.gz

tar -xvf premake-5.0.0-beta2-linux.tar.gz

#Fix some issue with altStackMem size
sed -i -e 's/SIGSTKSZ/32768/g' /workspace/EQ2EMu/EQ2/source/depends/recastnavigation/Tests/catch.hpp

./premake5 gmake

cd Build/gmake

make

cd ../../../..

git clone https://github.com/fmtlib/fmt.git

cd /workspace/EQ2EMu/EQ2/source/LoginServer/

make -j$(nproc)

cd /workspace/EQ2EMu/EQ2/source/WorldServer

make -j$(nproc)

mkdir -p /workspace/release

cd /workspace/release

cp /workspace/EQ2EMu/EQ2/source/WorldServer/eq2world ./ && cp /workspace/EQ2EMu/EQ2/source/LoginServer/login ./

cp -rT /workspace/EQ2EMu/server .

ls -ltra

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!    Successfully compiled and built     !!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
