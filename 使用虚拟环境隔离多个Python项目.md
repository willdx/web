# 使用虚拟环境隔离多个Python项目

## 1.安装pip

### 1.1 linux

(PS：在root下安装,非root不能使用yum命令)
```python
yum -y install python-pip 
pip install pip --upgrade  
```
  
### 1.2 ubuntu

(PS：在普通用户下也可以安装，但是要使用sudo)

```python
    sudo apt-get install python-pip
    sudo pip install pip --upgrade
```

## 2.修改默认的pip源

(PS: 用户级别的修改,系统的每个用户可以不一样)

### 2.1 修改为douban

> 国内推荐使用豆瓣源

```python
    vim ~/.pip/pip.conf
    [global]
    index-url = https://pypi.doubanio.com/simple/
    trusted-host = pypi.doubanio.com
```

### 2.2 修改为内部pypi服务器(可选)

```python
    vim ~/.pip/pip.conf 
    [global]
    index-url = http://pypi.ops.fenxibao.com/simple/
```

### 2.3 测试安装 simplejson

```python
    #若我们是在普通用户下：
    pip install simplejson  
    
    #会产生报错：
    `error: could not create '/usr/lib/python2.7/site-packages/simplejson': Permission denied 普通用户没有在/usr/lib/python2.7/site-packages/目录下创建文件和目录的权限`

    #分析原因：
    pip安装包的时候，需要将包中的文件放入python PATH中，而此时的普通用户没有该权限
    #查看python PATH：
    import sys
    sys.path
    
    解决办法：配置python虚拟环境,请继续查看后续步骤
```

## 3.安装和配置 zsh

(PS:我个人喜欢用zsh,所以后续配置在zsh中进行)

### 3.1 安装zsh

在root用户下：
```python
ubuntu:
apt-get install zsh 

linux:
yum -y install zsh
```

### 3.2 使用oh-my-zsh套件


```python
在普通用户下：
clone项目:  
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
使用模板:   
cp ~/.oh-my-zsh/templates/zshrc.zsh-template  ~/.zshrc
设为默认：
chsh -s /bin/zsh 
或者
sudo usermod -s /bin/zsh will
查看版本：
zsh --verison (PS：新开一个shell终端连接)
```

## 4.虚拟环境安装配置和使用

### 4.1 安装和配置

```python
    在root用户下：
    pip install virtualenv virtualenvwrapper
    find / |grep virtualenvwrapper.sh 
    例如结果是：/usr/bin/virtualenvwrapper.sh

    在普通用户下：
    vim  ~/.zshrc
    在末尾添加： source /usr/bin/virtualenvwrapper.sh
    运行命令使配置生效： source ~/.zshrc
    运行命令：mkvirtualenv  可以知道虚拟环境配置已生效
    (PS：默认的虚拟环境被创建在~/.virtualenvs/下,并且默认是--no-site-packages的不依赖系统中已经安装好的第三方包)
```

### 4.2 mkvirtualenv常规用法

    列出虚拟环境列表:     `workon` or `lsvirtualenv`
    新建虚拟环境:            ` mkvirtualenv [虚拟环境名称]`
    启动/切换虚拟环境:   ` workon [虚拟环境名称]`
    删除虚拟环境:            ` rmvirtualenv [虚拟环境名称]`
    离开虚拟环境:            `deactivate`

### 4.3  使用不同版本的Python创建虚拟环境

```
mkvirtualenv -p /Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6 pyodps
```



