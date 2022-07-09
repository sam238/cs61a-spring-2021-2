# Project 3: Ants Vs. SomeBees

## 介绍

[项目链接](https://inst.eecs.berkeley.edu/~cs61a/sp21/proj/ants/#introduction)

在这个项目，你会创建一个塔防游戏叫做`Ants Vs. SomeBees`，类似于植物大战僵尸，蚂蚁是棋子，蜜蜂是僵尸。

该项目使用面向对象编程范式。

## Phase 1: Basic gameplay

在第一个阶段你将实现两种基础蚂蚁：`HarvesterAnt`（产生实物）和 `ThrowerAnt`（进行攻击）。

### Problem 1 

**Part A:** 当前放置任何类型的蚂蚁没有花费，基类`Ant`的 `food_cost`类属性为0， 根据信息在重写`HarvesterAnt`和`ThrowerAnt`的这个类属性。

解决方案：根据指导在子类中重写类属性。

```py
class HarvesterAnt(Ant):
    # Add code here
    food_cost = 2

class ThrowerAnt(Ant):
    # Add code here
    food_cost = 3
```

**Part B:** 现在放置蚂蚁消耗食物，我们需要能够收集食物！为了解决这个问题，在`HarvesterAnt`类的`action`方法中添加1个食物到总食物`gamestate.food`中。

解决方案：在类方法中实现食物总数加一。

```py
class HarvesterAnt(Ant):

    def action(self, gamestate):
        # Add code here
        gamestate.food += 1
```

### Problem 2

你需要在`Place.__init__`中添加跟踪入口的代码，目前`Place`仅仅跟踪了出口`exit`属性，没有记录入口`entrance`属性。跟踪入口是有用的，这样我们将知道前方隧道的蜜蜂。

然而，简单的将入口参数传递给构造函数是有问题的，那样我们创造一个`Place`对象同时有入口和出口。为了解决该问题，我们使用下列方法：

- 创建一个新的`Place`对象，设置入口为`None`。
- 如果`Place`有`exit`属性，那么将`exit`的`entrance`属性设置为该对象。

解决方案： `exit`在左，`entrance`在右，从左向右创建通道。第一个结点（也是最左的结点）创建时入口设置`None`，以第一个结点作为构造函数参数创建第二个结点时，将第二个结点的出口（第一个结点）的入口设置为该对象（第二个结点），以此类推，便可以跟踪出入口创建通道。

```py
class Place:

    def __init__(self, name, exit=None):
        self.exit = exit
        self.entrance = None
        # Add code here
        if self.exit:
            self.exit.entrance = self
```

### Problem 3

