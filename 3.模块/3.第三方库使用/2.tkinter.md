# tkinter

```python
# -*- coding: utf-8 -*-
import random
from tkinter import *
import tkinter.simpledialog as dl
import tkinter.messagebox as mb

#设置GUI
root = Tk()
w = Label(root, text = "GodSay")
w.pack()

def main(num):
    mb.showinfo("欢迎", "欢迎来到GodSay")
    guess = dl.askinteger("Number", "输入数字测气运")

    #游戏部分
    if guess == num:
        output = '此子必有作为,彩票必中'
        mb.showinfo("GodSay: ", output)
    elif start < guess < end:
        o1 = '上帝给你关上一扇门的时候也可能会给你开一扇窗,继续输入'
        o2 = '成功也许是下一次'
        o3 = '失败乃成功他妈'
        o4 = '想放弃的时候，告诉自己，最后一次'
        o5 = "生死看淡，不服就干"
        output = random.choice([o1,o2,o3,o4,o5])
        mb.showinfo("神说: ", output)
        main(num)
    else:
        output = "不在状态?给点提示? \n既然你诚心发问,我便大发慈悲(PS:{}<x<{})".format(start,end)
        mb.showinfo("GodSay: ", output)
        main(num)

if __name__=="__main__":
    #设定一定范围的随机数
    start = 10
    end = 10000
    num =  random.randint(start,end)
    print("num:{}".format(num))
    main(num)
```



