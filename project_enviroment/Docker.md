# Docker basic enviroment configuration

    转载自清华大学开源镜像站

## Debian/Ubuntu 用户

以下内容根据[官方文档](https://docs.docker.com/engine/installation/linux/docker-ce/debian/)修改而来。

如果你过去安装过 docker，先删掉:

```sudo apt-get remove docker docker-engine docker.io```

首先安装依赖:

```sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common```

### Debian

信任 Docker 的 GPG 公钥:

```curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -```

对于 amd64 架构的计算机，添加软件仓库:

```bash
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
   $(lsb_release -cs) \
   stable"
```

如果你是树莓派或其它ARM架构计算机，请运行:

```bash
echo "deb [arch=armhf] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list
```

最后安装

```bash
sudo apt-get update
sudo apt-get install docker-ce
```

### Ubuntu

信任 Docker 的 GPG 公钥:

```curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -```

对于 amd64 架构的计算机，添加软件仓库:

```bash
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

如果你是树莓派或其它ARM架构计算机，请运行:

```bash
echo "deb [arch=armhf] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list
```

最后安装

```bash
sudo apt-get update
sudo apt-get install docker-ce
```

## Fedora/CentOS/RHEL

以下内容根据[官方文档](https://docs.docker.com/engine/installation/linux/docker-ce/centos/)修改而来。

如果你之前安装过 docker，请先删掉

```sudo yum remove docker docker-common docker-selinux docker-engine```

安装一些依赖

```sudo yum install -y yum-utils device-mapper-persistent-data lvm2```

根据你的发行版下载repo文件:  

```wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo```

把软件仓库地址替换为 TUNA:

```sudo sed -i 's+download.docker.com+mirrors.tuna.tsinghua.edu.cn/docker-ce+' /etc/yum.repos.d/docker-ce.repo```

最后安装:

```bash
sudo yum makecache fast
sudo yum install docker-ce
```

## Docker-compose

### install

下载当前的稳定版本

```sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose```

添加可执行权限

```sudo chmod +x /usr/local/bin/docker-compose```
