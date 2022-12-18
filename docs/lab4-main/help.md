# Lab4实验指导

## 学习LLVM API

你可以在[LLVM API使用手册](llvm-doc.md)中学习如何使用LLVM API，以及如何查找你需要的API

>本次实验仅需要一个基本块，因此基本块切换的部分目前可以不看

### 遍历语法树生成`LLVM IR`

我们可以新建一个visitor类继承`SysYParserBaseVisitor`，并且在定义类的时候初始化父类的`T` ，我们推荐你的返回值设为`LLVMValueRef`，如下

```java
public class MyVisitor extends SysYParserBaseVisitor<LLVMValueRef> {
    @Override
    public LLVMValueRef visit(ParseTree tree) {
        ...
    }

    @Override
    public LLVMValueRef visitTerminal(TerminalNode node) {
        ...
    }
    @Override
    public LLVMValueRef visitProgram(SysYParser.ProgramContext ctx) {
        ...
    }

    @Override
    public LLVMValueRef visitCompUnit(SysYParser.CompUnitContext ctx) {
        ...
    }
}
```

关于`LLVMValueRef`的简单介绍，你可以看https://cloud.tencent.com/developer/article/1352547。




## 使用LLVM API生成LLVM IR
- 在你的项目中引入LLVM相关的包，详见[LLVM API使用手册-准备工作](llvm-doc.md#准备工作)
- 在你的Visitor类中import LLVM，详见[LLVM API使用手册-准备工作](llvm-doc.md#准备工作)
- 在你的Visitor的构造函数中初始化LLVM，详见[LLVM API使用手册-初始化LLVM](llvm-doc.md#初始化LLVM)
- 为需要翻译的文件创建模块，详见[LLVM API使用手册-创建模块](llvm-doc.md#创建模块)
    - 你可以将手册中的`moudle`与`builder`与`i32Type`作为你的Visitor的成员变量
- 访问到函数定义时为`module`添加`function`（函数）并为`function`添加`basicBlock`（基本块），详见[LLVM API使用手册-生成函数](llvm-doc.md#生成函数)与[LLVM API使用手册-创建基本块并添加指令](llvm-doc.md#创建基本块并添加指令)
- 访问到`return`语句时使用`IRBuilder`在基本块内生成生成`ret`指令，详见[LLVM API使用手册-创建基本块并添加指令](llvm-doc.md#创建基本块并添加指令)
- 访问表达式运算时使用`IRBuilder`在基本块内生成能够实现该运算的指令[LLVM API使用手册-创建基本块并添加指令](llvm-doc.md#创建基本块并添加指令)
    - 翻译时请注意运算符的优先级