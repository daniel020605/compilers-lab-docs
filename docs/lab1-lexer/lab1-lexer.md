# Lab1:Lexer 实验要求

## Part1 词法分析
- 本次实验需要完成词法分析，要求如下
    - 当输入文件存在词法错误时报告词法错误在哪一行，格式为Error type A at line lineNo:errorMessage 其中lineNo为出错的token首个字符所在行的行号，errorMessage可自行定义，本实验不做要求，只要冒号前的信息正确即可
    - 当输入文件不存在词法错误时按照规定的格式进行输出

## 输出格式

### 输入

```SysY
int main() 
{
   // line comment
   /* 
     block comment
   */
   int i = 0x1;
}
```

### 输出

```java
INT int at Line 1.
IDENT main at Line 1.
L_PAREN ( at Line 1.
R_PAREN ) at Line 1.
L_BRACE { at Line 2.
INT int at Line 7.
IDENT i at Line 7.
ASSIGN = at Line 7.
INTEGR_CONST 1 at Line 7.
SEMICOLON ; at Line 7.
R_BRACE } at Line 8.

```
### 解释
每行输出一个token的信息，输出格式为 
```
[token类型] [token文本] at Line [此token首个字符所在行的行号].
```
输出时忽略所有注释，对十六进制和八进制数字常量输出token文本时需输出其十进制的值

## 实验帮助
点击[这里](lab1-lexer/help.md)查看实验一指导文档