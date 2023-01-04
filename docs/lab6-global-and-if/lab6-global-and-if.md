# Lab6:Global And If 实验要求

- 本次实验保证输入的正确性

## 实验开始前

请切换分支到`lab6`

## Part1 全局变量
- 本次实验需要翻译全局变量，要求如下
    - 除普通的int类型变量外还需要翻译int常量，数组变量与数组常量
    - 变量也会参与表达式运算
    - 为降低实验难度，其中数组将仅为一维数组，且不会使用全局变量对其他全局变量进行声明时的初始化，即不会出现以下情况
    ```SysY
    int a = 10;
    int b[2] = { a,12 };
    int main {
        //...
    }
    ```

- 说明：

    - 全局变量的初始化与使用与lab5中局部变量的初始化与使用类似，具体变量被如何使用请仔细看`SysYParser.g4`

## Part2 条件语句
- 本次实验需要完成对条件语句的翻译，要求如下
    - 需要翻译if语句与if-else语句，注意if语句与if-else语句是可以嵌套的

## 样例

### 样例一

输入：

```SysY
int a[3] = { 0,1,1 };
int main() {
    a[0] = !a[0];
    if (a[0]) {
        a[1] = 2;
    }
    return a[1];
}
```

输出：

```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

@a = global [3 x i32] [i32 0, i32 1, i32 1]

define i32 @main() {
mainEntry:
  %a = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i32 0), align 4
  %tmp_ = icmp ne i32 0, %a
  %tmp_1 = xor i1 %tmp_, true
  %tmp_2 = zext i1 %tmp_1 to i32
  store i32 %tmp_2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i32 0), align 4
  %a3 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i32 0), align 4
  %tmp_4 = icmp ne i32 0, %a3
  br i1 %tmp_4, label %true, label %false

true:                                             ; preds = %mainEntry
  store i32 2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i32 1), align 4
  br label %entry

false:                                            ; preds = %mainEntry
  br label %entry

entry:                                            ; preds = %false, %true
  %a5 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @a, i32 0, i32 1), align 4
  ret i32 %a5
}

```

### 样例二

输入：

```SysY
const int a = 10;
int main() {
    if (a != 10) {
        a = 2;
    }
    else {
        a = 20;
    }
    return a;
}
```

输出：

```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

@a = global i32 10

define i32 @main() {
mainEntry:
  %a = load i32, i32* @a, align 4
  %tmp_ = icmp ne i32 %a, 10
  %tmp_1 = zext i1 %tmp_ to i32
  %tmp_2 = icmp ne i32 0, %tmp_1
  br i1 %tmp_2, label %true, label %false

true:                                             ; preds = %mainEntry
  store i32 2, i32* @a, align 4
  br label %entry

false:                                            ; preds = %mainEntry
  store i32 20, i32* @a, align 4
  br label %entry

entry:                                            ; preds = %false, %true
  %a3 = load i32, i32* @a, align 4
  ret i32 %a3
}
```

提醒：你输出的`ir`不一定要跟助教一致，只要能正确执行并返回正确的结果即可。

## 实验帮助
点击[这里](lab6-global-and-if/help.md)查看实验六指导文档