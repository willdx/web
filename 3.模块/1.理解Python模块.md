# 理解Python模块

## 一个Python文件就是一个模块

> 需求:  输入一串字符, 分别统计出其中英文字母,空格,数字和其它字符的个数

isalpha方法判断是否是字母
isspace方法判断是否是空格
isdigit方法判断是否是数字

```python
# -*- coding: utf-8 -*-
def junger(string):
    """
    判断输入字符串的中英文字母、空格、数字和其它字符的个数
    """
    alpha = 0
    space = 0
    digit = 0
    other = 0
    for i in string:
        if i.isalpha():
            alpha += 1
        elif i.isspace():
            space+=1
        elif i.isdigit():           
            digit+=1
        else:
            other+=1
    print("中英文字母数量:{}".format(alpha))
    print("空格数量:{}".format(space))
    print("数字数量:{}".format(digit))
    print("其他字符数量:{}".format(other))
    return None

if __name__ == '__main__':
    #string = input("请输入待分析的字符串:\n")
    string = raw_input("请输入待分析的字符串:\n")
    junger(string)
```


## 作为脚本执行

> if __name__==“__main__”:  含义就是, 当Python作为脚本执行的时候, 执行判断条件下的语句, 可以看做是 **Python文件作为脚本执行入口**  

```shell
➜  ~ python junger.py
请输入待分析的字符串:
my name is will!
中英文字母数量:12
空格数量:3
数字数量:0
其他字符数量:1
```

## 作为模块导入

> 我们把脚本放到任意目录下, 命名为junger.py, 然后, 在文件所在目录执行ipython, 进入交互解释器环境;  
> 此时, 我们可以通过 import 的方式, 将Python代码做为一个模块导入进来, 直接当成函数来使用;  

```python
In [4]: from junger import junger

In [5]: junger("my name is will!")
中英文字母数量:12
空格数量:3
数字数量:0
其他字符数量:1
```


## 包含__init__.py的文件夹也被看成一个python模块

> __init__.py是初始化文件, 里面也可以写一些初始化的代码, 导入模块内容前会执行__init__.py文件代码

```shell
➜  ~ mkdir test_package
➜  ~ mv junger.py test_package
➜  ~ cd test_package
➜  test_package touch __init__.py
➜  test_package vim __init__.py
➜  test_package
➜  test_package cat __init__.py
print("__init__")
➜  test_package ls
__init__.py junger.py
➜  test_package cd ..
➜  ~ ipython
Python 3.6.5 (v3.6.5:f59c0932b4, Mar 28 2018, 05:52:31)
Type 'copyright', 'credits' or 'license' for more information
IPython 6.4.0 -- An enhanced Interactive Python. Type '?' for help.

__init__
In [1]: from test_package.junger import  junger

In [2]: junger("my name is will!")
中英文字母数量:12
空格数量:3
数字数量:0
其他字符数量:1
```



