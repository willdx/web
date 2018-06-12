# if条件判断
#Python/语法/if条件判断


```python
In [52]: def func(argv):
    ...:     if argv == 1:
    ...:         print("argv=1")
    ...:     elif argv == 2:
    ...:         print("argv=2")
    ...:     else:
    ...:         print("argv=other")
    ...:

In [53]: argv = 1

In [54]: func(argv)
argv=1

In [55]: argv = 2

In [56]: func(argv)
argv=2

In [57]: argv = 3

In [58]: func(argv)
argv=other
```



