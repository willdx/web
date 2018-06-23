# os模块


```python
In [6]: import os
# 查看当前目录的绝对路径
In [7]: os.path.abspath('.')
Out[7]: '/Users/daixiang/Desktop'
# 创建一个新目录
In [9]: os.mkdir(os.path.abspath('.') + "/test")
# 删除一个目录
In [10]: os.rmdir(os.path.abspath('.') + "/test")
```

> 将当前目录下的以数字开头的md文件重命名

```python
import os
for i in os.listdir():
    if i[0].isdigit():
        print("old:{}".format(i))
        ni = ".".join(i.split(".")[1:])
        os.rename(i, ni)
        print("new:{}".format(ni))
```

