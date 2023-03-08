# Lab1实验指导
## 第一步
首先你需要根据[SysY词法规则](2023/docs/lexer.md)中的词法规则编写SysYLexer.g4，然后为其生成词法分析器

## 第二步
你的Main.java应当接收一个参数，即文件路径，并将文件内容传给词法分析器
```java 
    public static void main(String[] args) throws IOException {
        if (args.length < 1) {
            System.err.println("input path is required");
        }
        String source = args[0];
        CharStream input = CharStreams.fromFileName(source);
        SysYLexer sysYLexer = new SysYLexer(input);
    }
```
## 第三步
antlr的词法分析器遇到错误时会向ANTLRErrorListener发送错误信息，自动生成的SysYLexer有一个默认的ErrorListener，你需要自行实现一个继承自BaseErrorListener的ErrorListener并添加给SysYLexer
```java 
    sysYLexer.removeErrorListeners();
    sysYLexer.addErrorListener(myErrorListener);
```

## 第四步
通过lexer的getAllTokens()函数触发lexer的错误检查并获得所有token，之后按格式输出tokens即可
```java 
    sysYLexer.getAllTokens();
```