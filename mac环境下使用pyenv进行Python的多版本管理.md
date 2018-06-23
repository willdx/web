# MAC环境下使用pyenv进行Python的多版本管理

> pyenv切换的是电脑默认情况下使用的Python版本
> 虚拟环境是为项目指定一个特定的Python版本

1.安装homebrew

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	测试是否安装成功
	brew -v

2.安装pyenv

	brew install pyenv
	验证是否安装成功
	pyenv -v

3.pyenv install --list 查看可以安装的python版本

	pyenv install --list

4.安装对应的python版本

	pyenv install 3.4.3

5.设定环境

	在 .bashrc(或者.bash_profile)(或者~/.zshrc)加入如下内容
	if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

6.pyenv global 来回切换python版本

	pyenv global system
	pyenv versions
	“system"是系统默认版本

7.命令详情

	pyenv commands


