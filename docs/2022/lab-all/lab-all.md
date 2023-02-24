# 实验须知

## 实验切换

- 每当你需要提交实验x时请切换分支为`labx`，如切换到实验九：
    ```git
        git checkout lab9
    ```
- 若不存在分支`labx`请新建分支并切换，仍以实验九为例：
    ```git
        git checkout -b lab9
    ```

## 实验提交要求

在实验中你需要提交如下内容：

1. Antlr语法规则文件以及Java可被正确编译运行的源代码
2. 一份pdf的实验报告，其内容包括：
    - 你的程序实现了什么样的功能？你是怎么实现的？你有哪些精巧的设计？
    - 你在做实验的过程中所遇到的有趣的现象或者你印象深刻的bug。
    - ⚠️实验报告不得为空白，但长度不得超过**2**页。不得向实验报告中粘贴大量的代码片段
        - 实验报告并不是写得越多越好，我们更重视报告的质量

## 分数占比

本次实验分数占比如下：

1. 实验报告：**30%**
2. 样例测试：**70%**

## 实验延期提交

- 实验可以申请延期提交，但最晚不超过ddl后72h
- 延期提交的实验得分为不延期提交的分数的70%

## 实验得分

实验得分以你的得分最高那一次的提交为准，实验报告则是以最后一次提交为准

例如测试用例满分100，你某次提交得到90分，debug后最后一次提交分数反而变成80，则测试用例分数按照90计算，但实验报告以最后一次即80分那一次提交为准

请注意，一旦申请延期，那么即使延期提交的分数\*70%低于原本ddl前某次提交的分数\*100%，我们也仅计算你实验最高分提交\*70%

例如测试用例满分100，你在ddl前的某次提交拿到了60分，申请延期后你拿到了80分，那么总分计为56分，而不是60分