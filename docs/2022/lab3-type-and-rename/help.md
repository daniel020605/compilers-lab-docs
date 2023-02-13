# Lab3实验指导

## 类型检查实验步骤

### 设计类型
为了满足类型检查的需要，我们就需要将SysY语言中定义的类型用特定的数据结构实现出来  
给定一个符号`a` ，在SysY语言中，它可以是基本类型`INT`，也可以是由基本类型构造出来的`ARRAY` ，当我们在`a` 的后面添加括号时，它又可以被理解成一个`FUNCTION` 。  
你可以创建多个类来表示上述的类型，并继承一个抽象父类`TYPE`  

另外，根据每个类型的值以及操作可以得到以下约束：

* 基本类型的类无需存储其他内容
* `ARRAY` 类需要存储其element类型以及element数量
* `FUNCTION` 类需要存储其返回类型以及每个参数的类型

对于`FUNCTION` 的参数存储可以使用一个列表
```java
public class FunctionType extends Type {
    Type retTy;
    ArrayList<Type> paramsType;
    ···
}
```

而对于`ARRAY`类型，由于其element可以为`ARRAY`或者基本类型，因此在保存时应当存储抽象父类`TYPE`  

以上仅供参考，同学们可以自行设计类型的实现方式

### 设计符号表
设计好类型后，下一步你应该思考如何存储一个符号的类型信息，以及给定一个符号名，如何得到它的类型信息，这就需要符号表来帮忙。  

符号表上的操作包括填表和查表两种，在定义一个新的符号的时候，你需要往符号表里添加这个符号名以及它对应的信息；在使用一个符号的时候，你需要判断符号表中是否存在这个符号的信息并且从符号表中得到这个符号的所有信息。

同时你需要考虑一个符号的作用域，每当进入新的block就要进入新的作用域了，退出block时又将会回到原本的作用域，请注意函数的参数应当视作在函数内部的那个作用域内

至于在符号表里应该填什么，这取决于你本身，只要觉得方便，可以向符号表中填入任何内容，包括但不限于类型信息

### 遍历语法树以及发现语义错误

经过第二次实验大家应该对遍历语法树有了初步的认知，接下来将介绍更多关于通过Visitor遍历语法树的知识

在使用Antlr生成对应的visitor代码后，可以看到生成的泛型类`SysYParserBaseVisitor` ，并且其中所有的函数返回值都是由泛型定义的，默认都是`null` 。要想实现自定义的返回值类型，我们可以新建一个visitor类继承该泛型类，并且在定义类的时候初始化父类的`T` ，如下

```java
public class MyVisitor extends SysYParserBaseVisitor<XXX> {
    @Override
    public XXX visit(ParseTree tree) {
        ...
    }

    @Override
    public XXX visitTerminal(TerminalNode node) {
        ...
    }
    @Override
    public XXX visitProgram(SysYParser.ProgramContext ctx) {
        ...
    }

    @Override
    public XXX visitCompUnit(SysYParser.CompUnitContext ctx) {
        ...
    }
}
```

之后只需要在访问对应节点时生成符号表以及检查类型即可

## 变量重命名

本实验存在多种实现方式，这里提供两种思路

### 在符号表中处理
在产生符号表时，用List额外保存该符号曾在哪一行哪一列被使用，之后可以遍历整个符号表根据保存的信息得到哪一个变量需要被重命名

在打印语法树时一旦发现token的起始行列在这个变量的使用List中就不打印原本名称而是变更后的名称

### 多次遍历语法树
第一次遍历语法树时生成符号表

第二次遍历时在符号表中找到那个行号列号对应的变量

最后打印语法树对其遍历时若发现一个变量为第二次遍历时找到的变量，则打印其变更后的名称

