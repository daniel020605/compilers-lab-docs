# Lab1:Lexer 实验要求

*本次实验内容：编译一个程序对使用SysY语言书写的源代码进行词法分析，并打印分析结果。*

*难点在于对SysY语法的熟悉和工具的熟练使用，预计需要1-2天时间。*

*实验要求使用语言识别工具Antlr4，使用**Java**语言来完成。*

*⚠️本实验中Main.java文件包含了程序启动的入口main方法，请勿在其他类中添加入口方法，如需新增其他Java类，请直接放在src目录下。*

*⚠️请确保独立完成本次实验*

## 实验内容

1. 实验开始前请新建本实验的分支`lab`，并在`lab1`分支下完成本次实验。

   ```
   git checkout -b lab1
   ```

2. 修改`.gitignore`文件，在最后一行添加`/out`，另外如果你有其它任何新生成的目录，也请添加到`.gitignore`。

3. 修改`Makefile`的`compile`目标为如下：

   ```makefile
   compile: antlr
   	$(call git_commit,"make")
   	mkdir -p classes
   	$(JAVAC) -classpath $(ANTLRPATH) $(JAVAFILE) -d classes
   ```

4. 输入输出：

   1. 输入格式：本次实验的输入是一个包含了`SysY`源代码的文件，你的程序需要接受一个文件名作为参数

   2. 输出格式：

      1. 本次实验要求通过**标准错误输出（stderr, 如System.err 等）**， 打印程序的 **所有** 运行结果。

      2. **包含词法错误的情况**：

         对于包含词法错误的文件，你需要打印**所有**错误信息，格式为：

         ```
         Error type A at Line [lineNo]:[errorMessage]
         ```

         其中`lineNo`为出错的`token`首个字符所在行的行号，`errorMessage`可自行定义，本实验不做要求，只要冒号前的信息正确即可。

      3. **不包含词法错误的情况**：

         对于没有任何词法错误的文件，你需要打印所有识别到的`Tokens`信息，具体输出格式可以参见**样例一**。

         ==特别要求==：输出时忽略所有注释，对十六进制和八进制数字常量输出`token`文本时需输出其十进制的值  

## 提交要求

本次实验提交要求如下：

1. Antlr语法规则文件以及Java可被正确编译运行的源代码
2. 一份pdf的实验报告，其内容包括：
   - 你的程序实现了什么样的功能？你是怎么实现的？你有哪些精巧的设计？
   - 你在做实验的过程中所遇到的有趣的现象或者你印象深刻的bug。
   - ⚠️实验报告不得为空白，但长度不得超过==**2**==页。不得向实验报告中粘贴大量的代码片段

## 分数占比

本次实验分数占比如下：

1. 实验报告：**30%**
2. 样例测试：**70%**

## 样例

### 样例一

输入

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

输出

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

解释：

每行输出一个token的信息，输出格式为 

```
[token类型] [token文本] at Line [此token首个字符所在行的行号].
```

==输出时忽略所有注释，对十六进制和八进制数字常量输出token文本时需输出其十进制的值==

特别注意，遇到如`int 2i = 08;`这种输入时，请将`2i`识别为`INTEGR_CONST`和`IDENT`，`08`识别为两个`INTEGR_CONST`，这种我们不认为是词法错误，这种错误将在后面的实验中处理 

### 样例二

输入:

```SysY
int main(){
  int i = 1;
  int j = ~i;
}
```

输出：

```
Error type A at Line 3: Mysterious character "~".
```

## 实验帮助

点击[这里](lab1-lexer/help.md)查看实验一指导文档

