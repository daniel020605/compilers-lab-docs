# Lab6实验指导

- 如实验五一样对于单纯的翻译并不需要指导，本文档仍然仅考虑一些可能遇到的问题

## 本次实验可能的难点
- 全局变量的使用与局部变量的不同
- 统一if语句与if-else语句的基本块，考虑使用condition，if_true和if_false三个基本块
- 当遇到a>b>c这种条件时如何翻译，考虑先使用i32类型，等到全部计算完毕再使用i1