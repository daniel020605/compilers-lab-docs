# Lab3:Type And Rename 实验要求

## 实验开始前

切换至分支`lab3`

## 实验输入

本实验包含四个输入，共两个部分，第一个部分与前两次实验一致，为一个源文件地址，第二部分包含三个输入（三个输入作为main函数的三个参数而不是一个参数）
- lineNo:int，需要重命名变量首字符所在的行号
- column:int，需要重命名变量首字符所在的列号
- name:String，需要重命名的变量变更后的变量名

注意，这四个参数均从`main`方法的`args`数组输入，即`args`数组长度为四。

## 实验内容

### Part1 类型检查

- 本次实验你需要完成类型检查，要求如下

    - 对于存在语义错误的输入，输出语义错误信息，格式为`Error type [errorTypeNo] at Line [lineNo]:[errorMessage]` 其中errorTypeNo为其错误类型编号，错误类型编号详见[](#类型检查的错误类型定义)，lineNo为出错的token首个字符所在行的行号，errorMessage可自行定义，本实验不做要求，只要冒号前的信息正确即可
- 对于不存在语义错误的输入文件，在本部分不输出任何内容
    - 请注意，请输出最本质的错误，对其进行合理的恢复后继续分析后续错误
- 使用**标准错误输出（System.err）**打印所有运行结果

### Part2 重命名

- 本部分你需要对指定的字符重命名，要求如下

    - 对存在语义错误的输入，本部分将不输出任何内容

    - 对不存在语义错误的输入要求按规定格式打印对特定变量重命名后的语法树，打印格式与实验二（parser）中一致。（包括十六进制、八进制数转为十进制数）。

    - 使用**标准错误输出（System.err）**打印所有运行结果


## 类型检查的错误类型定义

1. 变量未声明：使用了没有声明的变量

2. 函数未定义：使用了没有声明和定义的函数

3. 变量重复声明：声明全局变量时与函数同名，声明全局变量时与已声明的全局变量同名，声明局部变量与已声明的相同作用域的局部变量同名

4. 函数重复定义：定义函数时与已声明的全局变量同名，定义函数时与已定义的函数同名

5. 赋值号两侧类型不匹配：赋值号两侧的类型不相同

   + 说明：

     对于多维数组的初始化，我们保证它的初始化没有语义错误。比如：

     ```c
     int a[2][1] = {{1}, {2}}; 	// 我们保证它是以这种形式赋值的，并且是正确的
     ```

     另外，我们允许如下形式的多维数组间互相赋值：

     ```c
     int a[3][3][3];
     int b[2][2];
     a[1] = b;	//你可以将a[1]视作一个二维数组int[3][3]，这种赋值我们是合法的，也不会检查维度上长度不一致（3和2不一致）的问题
     a[1][1] = b;    //这种是不合法的，因为维度不一致
     ```

     

6. 运算符需求类型与提供类型不匹配：运算符需要的类型为int却提供array或function等

7. 返回值类型不匹配：返回值类型与函数声明的返回值类型不同

8. 函数参数不适用：函数参数的数量或类型与函数声明的参数数量或类型不一致

   + 为了降低实验难度，我们保证测试用例中的函数参数不会为多维（二维及以上）数组。

9. 对非数组使用下标运算符：对int型变量或函数使用下标运算符

10. 对变量使用函数调用：对变量使用函数调用运算符

11. 赋值号左侧非变量或数组元素：对函数进行赋值操作

## 样例

### 样例一

输入：

```SysY
int a(){
    return 1;
}

int a(){
    return 0;
}

int main(){
    b = c();
    int test1;
    int test1;
    int array[2] = {0,0};
    test1 = array;
    test1 = a + array;
    test1 = a(1);
    test1 = test1[0];
    test1();
    a = 1;
    return a;
}
```

输出：

```
Error type 4 at Line 5: Redefined function: a.
Error type 1 at Line 10: Undefined variable: b.
Error type 2 at Line 10: Undefined function: c.
Error type 3 at Line 12: Redefined variable: test1.
Error type 5 at Line 14: type.Type mismatched for assignment.
Error type 6 at Line 15: type.Type mismatched for operands.
Error type 8 at Line 16: Function is not applicable for arguments.
Error type 9 at Line 17: Not an array: test1.
Error type 10 at Line 18: Not a function: test1.
Error type 11 at Line 19: The left-hand side of an assignment must be a variable.
Error type 7 at Line 20: type.Type mismatched for return.

```

### 样例二

输入：



```SysY
int a() {
    return 10;
}

int main() {
    int a = 3;
    int b = 4;
    a = 5;
    return a;
}
```

```param
lineNo=8 column=4 name=d
```

输出：

```
Program
  CompUnit
    FuncDef
      FuncType
        int INT[orange]
      a IDENT[red]
        BlockItem
          Stmt
            return RETURN[orange]
            Exp
              Number
                10 INTEGR_CONST[green]
    FuncDef
      FuncType
        int INT[orange]
      main IDENT[red]
        BlockItem
          Decl
            VarDecl
              BType
                int INT[orange]
              VarDef
                d IDENT[red]
                = ASSIGN[blue]
                InitVal
                  Exp
                    Number
                      3 INTEGR_CONST[green]
        BlockItem
          Decl
            VarDecl
              BType
                int INT[orange]
              VarDef
                b IDENT[red]
                = ASSIGN[blue]
                InitVal
                  Exp
                    Number
                      4 INTEGR_CONST[green]
        BlockItem
          Stmt
            LVal
              d IDENT[red]
            = ASSIGN[blue]
            Exp
              Number
                5 INTEGR_CONST[green]
        BlockItem
          Stmt
            return RETURN[orange]
            Exp
              LVal
                d IDENT[red]

```

解释：

输入：行号定义为自第一行起每行加一，列号定义为该字符所在行在该字符前的字符数，即从`0`开始每字符加一，本例中第8行变量`a`前有四个空格字符`' '`，故列号为4

输出：本身和lab2格式一致，重命名时需要注意所有与被指定位置的变量为同一个变量的变量都应当被重命名

本例中第6，8，9行的变量a均为与被指定位置的变量的相同变量，重命名时需要一同变更，而函数虽然名称也是a但与指定变量并非同一个变量因此不进行重命名

## 实验帮助
点击[这里](lab3-type-and-rename/help.md)查看实验三指导文档

