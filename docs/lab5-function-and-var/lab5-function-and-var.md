# Lab5:Function And Var 实验要求

## 实验开始前

请切换分支到`lab5`

## Part1 函数定义与调用
- 本次实验需要完成对函数定义与函数调用的翻译
    - 为降低实验难度，本次实验的函数定义的参数将不为数组，但调用时可能会有将数组某一个元素作为实参传入的情况

## Part2 局部变量
- 本次实验需要完成对局部变量的声明，定义，使用的翻译。
    - 除普通的int类型变量外还需要翻译常量与数组变量（我们保证测试用例中的数组变量定义中数组的长度仅为常量表达式）。
    - 为降低实验难度，其中数组将仅为一维数组
    - 变量也会参与表达式运算
    
- 说明：

    - 局部变量的使用包括了许多种情况，包括：局部变量被赋值、一个局部变量赋值给另一个局部变量、局部变量作为函数返回值、局部变量作为函数的实参传入等等，具体有哪些情况你应该通过`SysYParser.g4`了解

    - 对于`int`常量和数组常量，它们的处理与`int`变量和数组变量一致，也就是说它们可以被翻译成相同的`LLVM IR`。因为对于`const`的检查应该只发生于语义分析阶段（虽然我们没有定义关于`const`的错误）。

    - 对于数组变量和数组常量的初始化，有如下三种情况：

        - ```c
            int main(){
                int a[5] = {1,2,3,4,5};
                return a[0];
            }
            ```

            数组长度与初始值长度相同，直接初始化即可。

        - ```c
            int main(){
                int a[5] = {1,2,3,4};
                return a[0];
            }
            ```

            数组长度与初始值长度不相同，缺的初始值补`0`。

        - ```c
            int main(){
                int a[5];
                return a[0];
            }
            ```

            数组未给初始值列表，不需要进行初始化。（不考察此情况）。



## 样例

### 样例一

输入：

```c
int f(int i){
    return i;
}

int main(){
    int a = 1;
    return f(a);
}
```

输出：

```c
; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @f(i32 %0) {
fEntry:
  %i = alloca i32, align 4
  store i32 %0, i32* %i, align 4
  %i1 = load i32, i32* %i, align 4
  ret i32 %i1
}

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  store i32 1, i32* %a, align 4
  %a1 = load i32, i32* %a, align 4
  %returnValue = call i32 @f(i32 %a1)
  ret i32 %returnValue
}

```



### 样例二

输入：

```c
int main(){
    int a[3] = {1,2,3};
    return a[1];
}
```

输出：

```c
; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @main() {
mainEntry:
  %a = alloca [3 x i32], align 4
  %pointer = getelementptr [3 x i32], [3 x i32]* %a, i32 0, i32 0
  store i32 1, i32* %pointer, align 4
  %pointer1 = getelementptr [3 x i32], [3 x i32]* %a, i32 0, i32 1
  store i32 2, i32* %pointer1, align 4
  %pointer2 = getelementptr [3 x i32], [3 x i32]* %a, i32 0, i32 2
  store i32 3, i32* %pointer2, align 4
  %res = getelementptr [3 x i32], [3 x i32]* %a, i32 0, i32 1
  %a3 = load i32, i32* %res, align 4
  ret i32 %a3
}
```

提醒：你输出的`ir`不一定要跟助教一致，只要能正确执行并返回正确的结果即可。


## 实验帮助
点击[这里](lab5-function-and-var/help.md)查看实验五指导文档
