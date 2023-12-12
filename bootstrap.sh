apt update
apt upgrade -y
apt install -y \
  build-essential \
  linux-headers-$(uname -r) \
  make \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  pkg-config \
  
apt install -y build-essential checkinstall zlib1g-dev
apt install -y git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
apt install -y curl g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev

apt install -y dkms
apt install -y ubuntu-mate-desktop

apt install -fy

apt install -y glances

apt install -y ruby-full
apt install -y rbenv

wget https://www.openssl.org/source/openssl-1.1.1q.tar.gz
tar xf openssl-1.1.1q.tar.gz
cd openssl-1.1.1q
./config --prefix=/opt/openssl-1.1.1q --openssldir=/opt/openssl-1.1.1q shared zlib
make
make test
make install
rm -rf /opt/openssl-1.1.1q/certs
ln -s /etc/ssl/certs /opt/openssl-1.1.1q

gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt/openssl-1.1.1q rbenv install 2.7.4

apt install -fy
