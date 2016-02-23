
# cleans gcc installation files
cd ~/tmp
rm -rf gcc_build && rm -rf gcc_4_9_3_release

# new binutils, used by julia
# https://www.gnu.org/software/binutils/
yum -y install bison # byacc # needed to build ld.gold, which is needed by nodejs
cd ~/tmp
wget http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz
tar xf binutils-2.26.tar.gz
cd binutils-2.26
./configure
make -j "$(nproc --all)"
make install
# Make ld.gold, used by nodejs
cd gold
./configure
make -j "$(nproc --all)"
make install
cd ../..
rm -rf binutils-2.26
rm -f binutils-2.26.tar.gz

### GIT
# http://tecadmin.net/install-git-2-0-on-centos-rhel-fedora/#
cd ~/tmp
wget https://www.kernel.org/pub/software/scm/git/git-2.7.1.tar.gz
tar xf git-2.7.1.tar.gz
cd git-2.7.1
make -j "$(nproc --all)" prefix=/usr/local all
make prefix=/usr/local install
cd ..
rm -f git-2.7.1.tar.gz && rm -rf git-2.7.1

# llvm needs CMake 2.8.12.2 or higher
# https://cmake.org/download/
cd ~/tmp
wget https://cmake.org/files/v3.4/cmake-3.4.3.tar.gz
tar xf cmake-3.4.3.tar.gz
cd cmake-3.4.3
./bootstrap && make -j "$(nproc --all)" && make install

cd ..
rm -f cmake-3.4.3.tar.gz && rm -rf cmake-3.4.3
