# 课程作业

最后更新于 {docsify-updated}。

## 书面作业
- [compilers-problem-set](https://github.com/courses-at-nju-by-hfwei/compilers-problem-set)

---
## 附加作业
本部分介绍附加作业相关要求与选题。

若有疑问, 请及时与任课教师联系。

请及时关注本文档的更新。

### **作业要求**
选择以下编号 1 ~ 5 中的一个题目，
- 制作报告
- 录制讲解视频

### **作业提交**
- 请填写 [2023-编译原理-附加作业统计表](https://table.nju.edu.cn/dtable/links/033aa8eaf0084cb7acd5) 表格 (需密码，请留意课程群信息) 前三列。
- 请将作业上传至 [2023-编译原理-附加作业统计表](https://table.nju.edu.cn/dtable/links/033aa8eaf0084cb7acd5) 第四列。
  - 压缩包命名: `学号-中文姓名-x.zip`, 其中 `x` 是作业编号
- 截止日期: 2023 年 2 月 13 日 晚上 23:00

### **评分方法**
- 评分以报告质量与视频质量为标准
- 每个选题满分为 5 分
- 可选多题完成, 但总分不超过 5 分。
- 每个选题不一定需要介绍所有列出的参考点，只要做得够好，就可能得满分。
- 每个选题也不限于列出的参考点, 可自行扩展

### **1. ANTLR4 中的 Adaptive LL(star) 语法分析算法**
#### **参考点**
- ALLStar 算法基本思想
- ALLStar 算法核心过程
- 通过 ANTLR 4 生成的语法分析器的源码分析 ALLStar 算法
#### **参考资料**
- 见 [compilers-papers-we-love/parsing/ANTLR/](https://github.com/courses-at-nju-by-hfwei/compilers-papers-we-love/tree/master/parsing/ANTLR)

### **2. Python 3.9 中的 PEG 语法分析算法**
[Python 3.9](https://docs.python.org/3.9/whatsnew/3.9.html#new-parser) 弃用了 LL(1) 语法分析算法，改用 PEG (Parsing Expression Grammar) 算法。

#### **参考点**
- PEG 算法的基本思想
- PEG 与 LL(1) 的区别
- PEG 算法
- Python 3.9 Parser 的使用方法

#### **参考资料**
- [PEP 617 – New PEG parser for CPython](https://peps.python.org/pep-0617/)
- [References in PEP 617](https://peps.python.org/pep-0617/#references)

### **3. LLVM 的类型系统**
#### **参考点**
- LLVM 的类型系统
- LLVM 的核心类，如 `Value`、`Type`、`Constant` 类

> 尽量结合实例代码进行讲解
#### **参考资料**
- [Type System @ LLVM Language Reference Manual](https://llvm.org/docs/LangRef.html#type-system)

### **4. SSA 构造算法与应用**
#### **参考点**
- SSA (静态单赋值形式) 的基本概念
- SSA 的构造算法
- SSA 的应用
> 建议结合 LLVM IR 进行介绍
#### **参考资料**
- 《编译器设计》(Engineering a Compiler; Second Edition)
  - 5.4.2 节
  - 9.3 节
- [Single-Static Assignment Form and PHI](https://mapping-high-level-constructs-to-llvm-ir.readthedocs.io/en/latest/control-structures/ssa-phi.html)
- [Static single-assignment form @ wiki](https://en.wikipedia.org/wiki/Static_single-assignment_form)

### **5. 词法分析可视化**
#### **参考点**
本作业是`词法分析可视化`工程项目, 希望完成
- NFA、DFA 可视化
- 正则表达式转 NFA 算法可视化
- NFA 转 DFA 算法可视化
- DFA 最小化算法可视化
- DFA 转正则表达式算法可视化
- DFA 生成词法分析器算法可视化

> 可以选择完成以上部分功能。作业截止后, 若有兴趣继续完成该项目, 可与我联系。

#### **参考资料**
- [jflap](https://www.jflap.org/)
> 可以参考 `jflap` 工具的部分实现

### ~~~**6. Python Lark 中的 LALR(1) 语法分析算法** (删除)~~~
Python Lark 库实现了 LALR(1) 语法分析算法。

#### **参考点**
- LR 类语法分析算法
- LR(0)/LR(1) 算法
- LALR(1) 算法
- Python Lark 的使用方法

#### **参考资料**
- 教材 (本科教学版) 4.5、4.6、4.7 节
- [8-parser-20211130-lr 课程录屏](https://www.bilibili.com/video/BV1LL4y1W7j2/?share_source=copy_web&vd_source=afddc1f6e07c3046ed07519aa34370fd)
- [9-parser-20211203-lr1 课程录屏](https://www.bilibili.com/video/BV1i34y1R7Tw/?share_source=copy_web&vd_source=afddc1f6e07c3046ed07519aa34370fd)