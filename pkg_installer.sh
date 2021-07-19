# change source
sudo cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g" /etc/apt/sources.list
sudo sed -i "s@http://.*security.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g" /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt install git curl

## nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
npm config set registry https://registry.npm.taobao.org

## python
sudo apt install python3-dev python3-pip
sudo npm install -g pyright
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

## conda
curl -SL "https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh" > "Miniconda3.sh"
bash Miniconda3.sh
rm Miniconda3.sh
cp condarc $HOME/.condarc

## docker
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

## neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim python3-neovim

## cpp
sudo apt-get install clangd-12

## Racket
sudo add-apt-repository ppa:plt/racket
sudo apt update
sudo apt install racket
raco pkg install racket-langserver
