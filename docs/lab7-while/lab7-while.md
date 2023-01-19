# Lab7:While 实验要求

- 本次实验保证输入的正确性
## 实验开始前

请切换分支到`lab7`

## Part1 while循环
- 本次实验需要翻译while循环，无特殊要求

## Part2 循环控制
- 本次实验需要翻译break和continue语句，要求如下
    - break仅跳出最内层的while循环，不允许跳出特定层循环
    - continue语句将会跳过最内层while循环后续所有语句直接进行其条件判断

## 样例

### 样例一

输入：

```SysY
int a[10]={5,4,3,2,1,8,6,2,4,7};

int main(){
    int i=0,j=0;
    int min=0;
    while(i<9){
        j=i;
        min=i;
        while(j<9){
            if(a[j]<a[min]){
                min=j;
            }
            j=j+1;
        }
        if(min!=i){
            int temp=a[min];
            a[min]=a[i];
            a[i]=temp;
        }
        i=i+1;
    }
    return a[3];
}
```

输出：

```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

@a = global [10 x i32] [i32 5, i32 4, i32 3, i32 2, i32 1, i32 8, i32 6, i32 2, i32 4, i32 7]

define i32 @main() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  %min = alloca i32, align 4
  store i32 0, i32* %min, align 4
  br label %whileCondition

whileCondition:                                   ; preds = %entry26, %mainEntry
  %i1 = load i32, i32* %i, align 4
  %tmp_ = icmp slt i32 %i1, 9
  %tmp_2 = zext i1 %tmp_ to i32
  %tmp_3 = icmp ne i32 0, %tmp_2
  br i1 %tmp_3, label %whileBody, label %entry

whileBody:                                        ; preds = %whileCondition
  %i4 = load i32, i32* %i, align 4
  store i32 %i4, i32* %j, align 4
  %i5 = load i32, i32* %i, align 4
  store i32 %i5, i32* %min, align 4
  br label %whileCondition6

entry:                                            ; preds = %whileCondition
  %a45 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 3), align 4
  ret i32 %a45

whileCondition6:                                  ; preds = %entry13, %whileBody
  %j9 = load i32, i32* %j, align 4
  %tmp_10 = icmp slt i32 %j9, 9
  %tmp_11 = zext i1 %tmp_10 to i32
  %tmp_12 = icmp ne i32 0, %tmp_11
  br i1 %tmp_12, label %whileBody7, label %entry8

whileBody7:                                       ; preds = %whileCondition6
  %j14 = load i32, i32* %j, align 4
  %res = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %j14
  %a = load i32, i32* %res, align 4
  %min15 = load i32, i32* %min, align 4
  %res16 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %min15
  %a17 = load i32, i32* %res16, align 4
  %tmp_18 = icmp slt i32 %a, %a17
  %tmp_19 = zext i1 %tmp_18 to i32
  %tmp_20 = icmp ne i32 0, %tmp_19
  br i1 %tmp_20, label %true, label %false

entry8:                                           ; preds = %whileCondition6
  %min27 = load i32, i32* %min, align 4
  %i28 = load i32, i32* %i, align 4
  %tmp_29 = icmp ne i32 %min27, %i28
  %tmp_30 = zext i1 %tmp_29 to i32
  %tmp_31 = icmp ne i32 0, %tmp_30
  br i1 %tmp_31, label %true24, label %false25

true:                                             ; preds = %whileBody7
  %j21 = load i32, i32* %j, align 4
  store i32 %j21, i32* %min, align 4
  br label %entry13

false:                                            ; preds = %whileBody7
  br label %entry13

entry13:                                          ; preds = %false, %true
  %j22 = load i32, i32* %j, align 4
  %tmp_23 = add i32 %j22, 1
  store i32 %tmp_23, i32* %j, align 4
  br label %whileCondition6

true24:                                           ; preds = %entry8
  %temp = alloca i32, align 4
  %min32 = load i32, i32* %min, align 4
  %res33 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %min32
  %a34 = load i32, i32* %res33, align 4
  store i32 %a34, i32* %temp, align 4
  %i35 = load i32, i32* %i, align 4
  %res36 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %i35
  %a37 = load i32, i32* %res36, align 4
  %min38 = load i32, i32* %min, align 4
  %res39 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %min38
  store i32 %a37, i32* %res39, align 4
  %temp40 = load i32, i32* %temp, align 4
  %i41 = load i32, i32* %i, align 4
  %res42 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %i41
  store i32 %temp40, i32* %res42, align 4
  br label %entry26

false25:                                          ; preds = %entry8
  br label %entry26

entry26:                                          ; preds = %false25, %true24
  %i43 = load i32, i32* %i, align 4
  %tmp_44 = add i32 %i43, 1
  store i32 %tmp_44, i32* %i, align 4
  br label %whileCondition
}
```


### 样例二

输入：

```SysY
int main(){
    int a=0;
    int count=0;
    while(a<=0){
        a=a-1;
        count=count+1;
        if(a<-20)
            break;
    }
    return count;
}
```

输出：
```LLVM IR
; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  store i32 0, i32* %a, align 4
  %count = alloca i32, align 4
  store i32 0, i32* %count, align 4
  br label %whileCondition

whileCondition:                                   ; preds = %entry8, %mainEntry
  %a1 = load i32, i32* %a, align 4
  %tmp_ = icmp sle i32 %a1, 0
  %tmp_2 = zext i1 %tmp_ to i32
  %tmp_3 = icmp ne i32 0, %tmp_2
  br i1 %tmp_3, label %whileBody, label %entry

whileBody:                                        ; preds = %whileCondition
  %a4 = load i32, i32* %a, align 4
  %tmp_5 = sub i32 %a4, 1
  store i32 %tmp_5, i32* %a, align 4
  %count6 = load i32, i32* %count, align 4
  %tmp_7 = add i32 %count6, 1
  store i32 %tmp_7, i32* %count, align 4
  %a9 = load i32, i32* %a, align 4
  %tmp_10 = icmp slt i32 %a9, -20
  %tmp_11 = zext i1 %tmp_10 to i32
  %tmp_12 = icmp ne i32 0, %tmp_11
  br i1 %tmp_12, label %true, label %false

entry:                                            ; preds = %true, %whileCondition
  %count13 = load i32, i32* %count, align 4
  ret i32 %count13

true:                                             ; preds = %whileBody
  br label %entry
  br label %entry8

false:                                            ; preds = %whileBody
  br label %entry8

entry8:                                           ; preds = %false, %true
  br label %whileCondition
}
```

提醒：你输出的`ir`不一定要跟助教一致，只要能正确执行并返回正确的结果即可。

## 实验帮助
点击[这里](lab7-while/help.md)查看实验七指导文档