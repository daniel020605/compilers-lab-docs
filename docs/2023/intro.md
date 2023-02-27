# 课程简介

最后更新于 {docsify-updated}。

## 课程信息

- **课程名称：** 编译原理 (Compilers)

- **课程简称：** `Compilers`

- **课程编号：** 25000540

- **课程性质：** 必修课

- **授课对象：** 南京大学软件学院 2021软件工程专业

- **时间地点：**

<!-- tabs:start -->

### **编译原理 01 班**
- 星期三 5-6 节: 1-17 周 逸 B-212
- 星期五 5-6 节: 4-16 周 逸 B-212 (双周)

### **编译原理 02 班**

<!-- tabs:end -->

<!-- - **课程图标：** ![Compiler](../.assets/images/Compiler.svg ':size=15%') -->

- **授课教师：**

<!-- tabs:start -->

### **编译原理 01 班**

- [魏恒峰](https://hengxin.github.io/) <small>([蚂蚁蚂蚁](https://www.bilibili.com/video/BV16y4y1Y7u6))</small>

### **编译原理 02 班**

- [冯洋](https://fengyang-nju.github.io/)

<!-- tabs:end -->

## 考核方式

本课程的分数构成为:

- **平时作业 (0 分)**: 每周一次，自愿完成，自愿提交
- **课程实验 (75 分)**: 10~12 次实验 + 1 次选做实验 (附加 5 分)
- **期末测试 (25 分)**: 两小时; 开卷

对于课程实验, 我们会给足充分的时间, 只要不是踩着 DDL,
理应能游刃有余地完成它们.

期末测试题型与平时作业题型有较大重叠。

## 教学周历

!> 具体内容可能会随课堂进度进行调整。

?> 查看 [课程资源](resources) 获取课件、演示代码、电子书籍等。

- D: 《编译原理 本科教学版》(龙书)
- A: 《ANTLR 4 权威指南》
- L: 《编程语言实现模式》(Language Implementation Patterns)
- R: 《编译系统透视 (See Compiling System Run)》
- E: 《编译器设计 第二版 (Engineering a Compiler)》

| 周数 | 内容 | 知识点 | 阅读材料 | 备注 |
| ----- | ----- | ----- | ----- | ----- |
| 1 (0-intro) | Intro. to Compilers | 课程简介、 编译原理概述 | D1.1、D1.2；A1.1、A1.2 | |
<!-- | 3 (1-lexer-re-antlr) | Lexer 自动生成器 | ANTLR 4 词法分析器、正则语言、正则表达式 | D3.1、D3.2；A4.1、A5.5、A15.5 | | -->
<!-- | 11 (2-lexer-handwritten) | 手写词法分析器 | 手写词法分析器，状态图 | D2.6、D3.3、D附录A.3；R2 | R2 为课外选读 |
| 11 (3-lexer-automata) | 自动化词法分析器 | 自动机理论 | D3.5、D3.6、D3.7；E2.6.1、E2.6.2 | E2.6.2 为课外选读 |
| 12 (4-parser-cfg-antlr) | Parser 自动生成器 | ANTLR 4 语法分析器、上下文无关文法、EBNF | D4.1、D4.2、D4.3；A5.3、A5.4、A6.4、A8.3 | D4.1.3、D4.1.4、D4.3.5 除外；A4.1、A4.2、A4.3 选读 |
| 12 (4.3-parser-cfg-antlr-re) | 补充 3-、4- 两次课遗留内容 | | | |
| 13 (5-parser-ll) | 递归下降的 LL(1) 语法分析算法 | LL(1) | D4.4 | D4.4.5 暂时略过 |
| 13 (6-parser-allstar) | ALLStar 语法分析算法 | 优先级上升算法、ALLStar 算法、二义性消解策略 | A前言、A13.7、A14 | 优先级上升算法需要掌握，其余为扩展介绍内容 |
| 14 (7-symtable) | 符号表 | 符号表构造方法 | A8.4、L6 | L7 选读 |
| 14 (8-semantics-type-system) | 类型系统| 类型推导、类型检查 | D5.3.2、D6.5 | |
| 15 (9-semantics-ag (1)) | 属性文法 | ANTLR 4 中的属性与动作 | A10 | A10.3 选读 |
| 15 (9-semantics-ag (2)) | 属性文法 | SDD 与 SDT | D5 | D5.4.2、D5.5.3、D5.5.4 暂时跳过 |
| 16 (10-llvm-ir) | LLVM IR 简介 | LLVM IR, LLVM Java API | [http://docs.compilers.cpl.icu/#/2022/llvm-doc](2022/llvm-doc) | |
| 17 (11-ir-expr-control) | 表达式与控制流的中间代码生成 | LLVM IR, 控制流中间代码 | D6.4、D6.6 | D6.7 选读 |
| 17 (12-parser-lr0) | LR 语法分析算法 | LR(0)、SLR | D4.5、D4.6 | |
| 18-补充 (13-parser-lr1) | LR 语法分析算法 | LR(1)、LALR | D4.7 | D4.7.5 选读 | -->

## 学习方法

?> **纸上得来终觉浅, 绝知此事要躬行**

本课程**注重实践**, 会有多次课程实验。

在学习编译原理时, 仅仅是看书与死记硬背知识点是没有意义的。

只有自己动手实现一个编译器, 才能真正去理解编译原理。
