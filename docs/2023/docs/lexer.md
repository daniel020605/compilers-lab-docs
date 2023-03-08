# 词法规则

词法生成规则如下，注意空白符和注释需要跳过

```antlr
CONST -> 'const';

INT -> 'int';

VOID -> 'void';

IF -> 'if';

ELSE -> 'else';

WHILE -> 'while';

BREAK -> 'break';

CONTINUE -> 'continue';

RETURN -> 'return';

PLUS -> '+';

MINUS -> '-';

MUL -> '*';

DIV -> '/';

MOD -> '%';

ASSIGN -> '=';

EQ -> '==';

NEQ -> '!=';

LT -> '<';

GT -> '>';

LE -> '<=';

GE -> '>=';

NOT -> '!';

AND -> '&&';

OR -> '||';

L_PAREN -> '(';

R_PAREN -> ')';

L_BRACE -> '{';

R_BRACE -> '}';

L_BRACKT -> '[';

R_BRACKT -> ']';

COMMA -> ',';

SEMICOLON -> ';';

IDENT : 以下划线或字母开头，仅包含下划线、英文字母大小写、阿拉伯数字
   ;

INTEGER_CONST : 数字常量，包含十进制数，0开头的八进制数，0x或0X开头的十六进制数
   ;

WS
   -> [ \r\n\t]+
   ;

LINE_COMMENT
   -> '//' .*? '\n'
   ;

MULTILINE_COMMENT
   -> '/*' .*? '*/'
   ;
```