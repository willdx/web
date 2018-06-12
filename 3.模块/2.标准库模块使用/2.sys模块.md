# sys模块


## 用于参数传递
```python
import sys
print("执行脚本传递参数:{}".format(sys.argv))
```

## 用于退出程序

```python
import sys
sys.exit(0) # 0 正常退出, 非0表示异常退出
```

## 用于查看Python模块的执行路径

```python
In [4]: import sys

In [5]: sys.path
Out[5]:
['',
 '/Library/Frameworks/Python.framework/Versions/3.6/bin',
 '/Library/Frameworks/Python.framework/Versions/3.6/lib/python36.zip',
 '/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6',
 '/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/lib-dynload',
 '/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages',
 '/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/IPython/extensions',
 '/Users/daixiang/.ipython']
```

