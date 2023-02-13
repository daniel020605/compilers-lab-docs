修改记录：

+ 修改了LLVM IR输出方式；
+ 12.22 13:27 修改输入参数说明；
+ 12.22 16:42 提醒删除无用的`import`

# Lab4:Main 实验要求

- 从本次实验开始后续实验均为翻译中间代码

- 本实验保证输入的正确性

- 若无特殊说明，则本实验及后续实验需要翻译的内容的语义均与C语言保持一致

- 请删除关于`LLVM`的所有无用的`import`，服务器只维持了能在服务器环境下生成`LLVM IR`的最小`Jar`包集合，如果你`import`了不相关的文件，可能会导致`Fail to make`。

- 若无特殊说明，则本实验及后续实验进行翻译时均翻译为LLVM IR。你的`main`函数应该接受两个参数，第一个参数是源文件路径，第二个参数是生成的LLVM IR存放的文件路径。

  输出方式：

  ```java
  public static final BytePointer error = new BytePointer();
  
  
  if (LLVMPrintModuleToFile(moudule, args[1], error) != 0) {	// moudle是你自定义的LLVMModuleRef对象
  	LLVMDisposeMessage(error);
  }
  ```


## 实验开始前

请切换分支到`lab4`

由于`make compile`命令编译你的源文件需要`lab4`新下载的`jar`包，而这些`jar`包的`classpath`设置比较复杂（在mac、windows、linux以及x64、arm架构上都不同，所以助教无法给出一个统一的`classpath`设置），因此本次实验开始你不能再使用`make compile`命令，另外修改你的Makefile文件中目标submit为如下（因为compile不可用所以要删除compile，如果你要对`g4`文件生成`java`文件，请使用`make antlr`命令）：

```makefile
submit: clean
	git gc
	bash submit.sh
```

记得提交前手动`add`、`commit`。

## Part1 翻译main函数

- 本次实验需要完成对`main`函数的翻译，要求如下
    - `main`函数无参数且返回值为`int`类型
    - 仅包含`return`语句

## Part2 翻译表达式
- 需要完成对表达式的翻译，要求如下
    - 在`return`时不仅仅会返回一个单独的数字，而是返回一个常量表达式
    - 常量表达式仅包含整形字面值常量及其运算

## 包含的运算符

```java
//单目运算符
'-'//相反数，返回一个整数的相反数
'!'//取反，非0值返回0，0值返回1
'+'//正号，没有作用，返回原本的值即可

//二目运算符
'+'//加法运算符，a+b返回a与b的和
'-'//减法运算符，a-b返回a与b的差
'*'//乘法运算符，a*b返回a与b的积
'/'//除法运算符，a/b返回a与b的商
'%'//取模运算符，a%b返回a对b的余数
```

## 样例

### 样例一

输入：

```SysY
int main(){
    return -2;
}
```

输出：
```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @main() {
mainEntry:
  ret i32 -2
}

```

### 样例二

输入：

```SysY
int main(){
    return 3+2*5;
}
```

输出：
```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @main() {
mainEntry:
  ret i32 13
}

```

## 实验帮助
点击[这里](2022/lab4-main/help.md)查看实验四指导文档
