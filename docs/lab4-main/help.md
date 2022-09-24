# Lab4实验指导

## 学习LLVM API

你可以在[LLVM API使用手册](llvm-doc.md)中学习如何使用LLVM API，以及如何查找你需要的API

## 使用LLVM API生成LLVM IR
- 在你的项目中引入LLVM相关的包
- 在你的Visitor类中import LLVM
- 在你的Visitor的构造函数中初始化LLVM
- 创建上下文信息
- 创建module
- 初始化IRBuilder
- 访问到函数定义时为module添加函数并为函数添加基本块
- 访问到return语句时使用IRBuilder在基本块内生成生成ret指令
- 访问表达式运算时使用IRBuilder在基本块内生成能够实现该运算的指令