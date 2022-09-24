# Lab4:Main 实验要求

- 本实验保证输入的正确性

## Part1 翻译main函数
- 本次实验需要完成对main函数的翻译，要求如下
    - 将一个仅包含无参数且返回值为int类型的main函数与return语句的程序翻译为LLVM IR并输出到src/test/test.ll便于检查运行结果

## Part2 翻译表达式
- 需要完成对表达式的翻译，要求如下
    - 在return时不仅仅会return一个单独的数字，而是一个常量表达式
    - 常量表达式仅包含整形字面值常量，不包含符号常量

## 实验帮助
点击[这里](lab4-main/help.md)查看实验四指导文档