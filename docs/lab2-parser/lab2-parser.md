# Lab2:Parser 实验要求

## 实验开始前

- 请切换git分支至`lab2`

## 实验输入

同lab1

## 实验内容

### Part1 语法分析与高亮

- 本次实验需要完成语法分析与高亮，要求如下
    - 根据实验指导内提供的文档完成SysyParser.g4并将SysYParser.g4中按下面已经给出的写法将exp和cond写成左递归

    - 当**输入文件存在语法错误时**：输出语法错误在哪一行，格式为`Error type B at Line [lineNo]:[errorMessage]` 其中lineNo为出错的token首个字符所在行的行号，errorMessage可自行定义，本实验不做要求，只要冒号前的信息正确即可，需要输出所有的错误

    - 当**输入文件不存在语法错误时**：按照规定格式输出语法树(含高亮)，输出格式详见**样例一**
    
    - 使用**标准错误输出（System.err）**打印所有运行结果

## 改成左递归的形式

`Antlr`的强大之处就在于它能够自己处理左递归和优先级关系（通过先后顺序，越靠前的优先级越高）。在`SysY语言定义`中，为了能处理左递归它采用了一种比较复杂的语法定义方式。由于`Antlr`能自己处理左递归因此我们不需要采取它的方式，直接写成如下形式即可。所以你需要删除掉`SysY语言定义`中的关于`exp`和`cond`的语法单元（比如AddExp，PrimaryExp，UnaryExp等等），直接替换成如下形式即可，因为它们是语义上等价的。

``` antlr 
exp : L_PAREN exp R_PAREN
   | lVal
   | number
   | IDENT L_PAREN funcRParams? R_PAREN
   | unaryOp exp
   | exp (MUL | DIV | MOD) exp
   | exp (PLUS | MINUS) exp

cond
   : exp
   | cond (LT | GT | LE | GE) cond
   | cond (EQ | NEQ) cond
   | cond AND cond
   | cond OR cond
   ;
```

因为有些同学还是对于如何改写有疑惑，这里助教给出我们的写法。

将`SysY语言定义`的这部分：

```
Exp 		-> 	AddExp
Cond 		-> 	LorExp
Lval 		-> 	Ident {'[' Exp ']'}
PrimaryExp 	-> 	'('Exp')'|LVal|Number
Number 		-> 	IntConst
UnaryExp 	-> 	PrimaryExp | Ident '('[FuncRParams]')' | UnaryOp UnaryExp
UnaryOp 	-> 	'+' | '−' | '!'
FuncRParams	-> 	Exp { ',' Exp }
MulExp		-> 	UnaryExp | MulExp ('*' | '/' | '%') UnaryExp
AddExp		-> 	MulExp | AddExp ('+' | '−') MulExp
RelExp		-> 	AddExp | RelExp ('<' | '>' | '<=' | '>=') AddExp
EqExp		-> 	RelExp | EqExp ('==' | '!=') RelExp
LAndExp		->	EqExp | LAndExp '&&' EqExp
LOrExp		->	LAndExp | LOrExp '||' LAndExp
ConstExp	->	AddExp 
```

改写为如下形式：

```
exp
   : L_PAREN exp R_PAREN
   | lVal 
   | number
   | IDENT L_PAREN funcRParams? R_PAREN 
   | unaryOp exp 
   | exp (MUL | DIV | MOD) exp
   | exp (PLUS | MINUS) exp
   ;

cond
   : exp 
   | cond (LT | GT | LE | GE) cond
   | cond (EQ | NEQ) cond 
   | cond AND cond 
   | cond OR cond 
   ;

lVal
   : IDENT (L_BRACKT exp R_BRACKT)*
   ;

number
   : INTEGR_CONST
   ;

unaryOp
   : PLUS
   | MINUS
   | NOT
   ;

funcRParams
   : param (COMMA param)*
   ;

param
   : exp
   ;

constExp
   : exp
   ;
```

注意：改写的过程中助教为了方便大家理解实参列表`FuncRParams`以及与形参的书写形式对应，因此在`FuncRParams	-> 	Exp { ',' Exp }`的语法定义中新增了一层`FuncRParams -> Param {',' Exp}`，  `Param -> Exp`，这一点在实验指导文档中也提及到了。

**注意**：以上的改写并不会改变`SysY`语言的表达能力，但这样改写后看起来就直观很多，也与大家课上学习的`Antlr`能处理左递归相呼应。希望大家不满足于之间搬运助教的翻译结果，仔细揣摩这二者之间的等价性。

## 样例

### 样例一

输入：

```SysY
int main() {
    int a=0;
    return a;
}
```
输出：

```
Program
  CompUnit
    FuncDef
      FuncType
        int INT[orange]
      main IDENT[red]
      Block
        BlockItem
          Decl
            VarDecl
              BType
                int INT[orange]
              VarDef
                a IDENT[red]
                = ASSIGN[blue]
                InitVal
                  Exp
                    Number
                      0 INTEGR_CONST[green]
        BlockItem
          Stmt
            return RETURN[orange]
            Exp
              LVal
                a IDENT[red]

```

解释

每个语法节点或词法节点占用一行，在语法树每向下一层缩进两个空格，部分终结符要求输出其终结符的文本、名称以及颜色，其中文本与名称之间包含一个空格，注意，输出颜色时并不需要真正修改你的输出的颜色，只需要将`[red]`这个字符串紧随在终结符名称后输出即可，要输出名称及颜色的终结符见其他要求

### 样例二

输入

```SysY
int main(){
    int a[];
    return a][;
}
```

输出

```
Error type B at Line 2: mismatched input ']' expecting {'+', '-', '!', '(', IDENT, INTEGR_CONST}
Error type B at Line 3: mismatched input ']' expecting {'+', '-', '*', '/', '%', '[', ';'}
```

解释

- 在第二行的错误中我们需要一个int在`[]`中间所以报一个语法错误
- 在第三行的错误中，虽然我们要求输出全部错误，这里`a`后面出现`]`和`[`后面出现`;`都不对，但是antlr4会在发生错误后重新尝试去匹配可以匹配的字符，所以这里`]`和`[`都会被丢弃，只有`;`被匹配到了，因为两个字符被一同处理所以只报一次错误
- 请注意，虽然该样例中一行仅有一个语法错误，但我们的实验测试用例不保证一行只出现一个语法错误

## 其他要求

- 关于颜色，要求如下
    - 保留字为 orange
    - 运算符为 blue
    - 数字与字符串为 green
    - 标识符为 red
```java
//保留字
CONST[orange],
INT[orange], 
VOID[orange],
IF[orange], 
ELSE[orange], 
WHILE[orange], 
BREAK[orange], 
CONTINUE[orange], 
RETURN[orange],
//运算符
PLUS[blue], 
MINUS[blue], 
MUL[blue], 
DIV[blue], 
MOD[blue], 
ASSIGN[blue], 
EQ[blue], 
NEQ[blue], 
LT[blue], 
GT[blue],
LE[blue], 
GE[blue], 
NOT[blue], 
AND[blue], 
OR[blue],
//标识符 
IDENT[red], 
//数字与字符串
INTEGR_CONST[green],
```

## 实验帮助
点击[这里](lab2-parser/help.md)查看实验二指导文档
