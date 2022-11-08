# 环境配置

## Java环境
无论你在哪个平台进行编程，都需要Java环境，相信已经学过软工二的各位一定已经配置好Java环境了，这里不再赘述。

## Antlr4

- 若使用IDE，仅需安装Antlr的插件即可，以IDEA为例，在左上角，文件->设置->插件，搜索ANTLR4即可找到插件，下载后重启即可，之后可通过该插件处理.g4文件
- 若文本编辑器则需自行安装Antlr
    - 前往[Antlr官网](https://www.antlr.org/download.html)，下载Complete ANTLR 4.9.X.jar，对于Linux也可以选择从命令行，使用**curl -O https://www.antlr.org/download/antlr-4.9.1-complete.jar**
    - 添加环境变量，在环境变量中的CLASSPATH中添加jar文件所在位置
        - Windows下关闭所有窗口后重新打开命令行，输入**java org.antlr.v4.Tool**，查看是否安装成功
        - Linux下执行**source ~/.bashrc**使环境变量生效输入**java org.antlr.v4.Tool**，查看是否安装成功

## LLVM

### Linux下安装

```bash
sudo apt-get install llvm
sudo apt-get install clang
```
安装后可通过如下命令测试，出现版本信息即为安装成功

```bash
clang -v
lli --version
```
### Windows下安装

?> 非常不建议，安装起来非常复杂，有条件请一定选择Linux
- 方法一：在[这里](https://github.com/llvm/llvm-project/releases/tag/llvmorg-14.0.0)安装自己系统的安装程序进行安装
    - 注意，这种方式安装的Clang+LLVM是没有lli命令的，会对之后的学习产生影响
- 方法二：clone 源码自行编译
    - 在[这里](https://github.com/llvm/llvm-project)clone源码
    - 使用cmake生成，generator选择Visual Studio，可以生成VS的解决方案
        - 需要CMake，GCC，Visual Studio，zlib，python，GNU Make才可生成，命令如下
        - cd llvm-project
        - cmake -DLLVM_ENABLE_PROJECTS=clang -G "Visual Studio 16" -A x64 -Thost=x64 ..\llvm
    - 生成完毕后在cmake生成的VS解决方案中去进行INSTALL这个解决方案的生成
    - 最后将llvm-project/build/Debug/bin加入PATH环境变量


