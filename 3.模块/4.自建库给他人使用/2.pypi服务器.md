# 内网Pypi服务器

[TOC]

[参考](http://python-packaging-zh.readthedocs.io/zh_CN/latest/minimal.html)

### 0.概述

```python
服务器位置:
    10.117.70.106(测试服务器)
项目位置: 
    /home/jacky007wang/will/pypi_server
启动脚本:
    extranet_start.sh  对外开放
    intranet_start.sh   对内开放
停止脚本:
    stop.sh  kill进程
上传包位置: 
    /home/jacky007wang/will/pypi_server/packages
```

### 1.搭建

[github链接]https://github.com/pypiserver/pypiserver

#### 1.1创建服务目录

```python
mkdir ~/will/pypi_server
cd  ~/will/pypi_server
```

#### 1.2.虚拟环境

```python
mkvirtualenv pypi_server
pip install pypi_server
pip install passlib
mkdir packages
```

#### 1.3.添加htpasswd

```python
# 执行命令生成密码文件
htpasswd -sc .htaccess 用户名 
注释: 执行命令将提示你输入密码,该用户名和密码用于在上传打包好的python包到此pypi服务器需要输入到用户名和密码
```

#### 1.4创建服务启停脚本

>extranet_start.sh文件内容

```python
#!/bin/bash
virdir="/home/jacky007wang/.virtualenvs"
package_dir="/home/jacky007wang/will/pypi_server/packages"
source $virdir/pypi_server/bin/activate
exec pypi-server -P .htaccess  -p 3141  $package_dir
```
>intranet_start.sh文件内容

```python
#!/bin/bash
virdir="/home/jacky007wang/.virtualenvs"
package_dir="/home/jacky007wang/will/pypi_server/packages"
source $virdir/pypi_server/bin/activate
exec pypi-server -i 10.117.70.106 -P .htaccess  -p 3141  $package_dir
```

>stop.sh文件内容

```python
#!/bin/bash
exec ps -ef | grep pypi-server | grep 3141 |grep -v grep | awk '{print $2}' | xargs -n 1 kill
```

### 2.启动/停止

```python
cd  /home/jacky007wang/will/pypi_server
启动:
    nohup ./intranet_start.sh &
停止:
    ./stop.sh
```

### 3.使用


#### 3.1 打包服务器配置

```python
# 在代码打包服务器上家目录添加配置文件
    vim ~/.pypirc
    添加如下内容:
[distutils]
index-servers =
    internal

[internal]
repository:http://10.117.70.106:3141
username=xz
password=XXXXX  #注意密码使用htpasswd创建
```

#### 3.2 上传package

```python
然后在你要上传的Python项目的目录下，执行这个命令
    python setup.py sdist upload -r internal
    
若没有报错你能在sdist看到打好的包, 以godbox为例:
在提交包的目录下的dist子目录能看到打好的包:

    ➜  dist pwd
    /home/jacky007wang/will/godbox/dist
    ➜  dist ls
    godbox-0.0.1.tar.gz

在pypi服务器上能看到上传的包:
    /home/jacky007wang/will/pypi_server/packages
    ``(pypi_server) ➜  packages ls
    godbox-0.0.1.tar.gz
```

#### 3.3 安装package

```python
pip install -i http://10.117.70.106:3141/simple/ package_name
```


```python
# 使用开发模式安装这个包, 每次修改代码之后不用重新安装, 立即可用最新的代码, 调试成功后再发布到pypi
python setup.py develop
```





