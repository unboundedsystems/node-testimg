set -ex

echo NODE_VER: $NODE_VER

APT_INSTALLS=(
    apt-transport-https
    bzip2
    ca-certificates
    curl
    g++
    git
    gnupg2
    gyp
    iputils-ping
    less
    make
    moreutils
    nginx-light
    pigz
    procps
    python-pip
    software-properties-common
    ssh
    unzip
    vim
    xz-utils
)

apt-get update
apt-get install -y --no-install-recommends "${APT_INSTALLS[@]}"

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y --no-install-recommends docker-ce

# yarn
if [[ ${NODE_VER} =~ ^10 ]]; then
    npm install yarn@~1.21.1 -g
fi

# Clean up
apt-get clean
