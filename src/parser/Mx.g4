grammar Mx;

program: (globalVariableDef | functionDef | classDef)* ;

functionDef : functionType Identifier '(' functionParameterDef ')' suite ;
functionParameterDef : (varType Identifier (',' varType Identifier)*)? ;

varDef : varType varDeclare ;

suite : '{' statement* '}';

statement
: suite #block
| varDef #vardefStmt
| If '(' expression ')' trueStmt=statement
(Else falseStmt=statement)? #ifStmt
| Return expression? ';' #returnStmt
| expression ';' #pureExprStmt
| ';' #emptyStmt
;
expression
: primary #atomExpr
| expression op=('+' | '-') expression #binaryExpr
| expression op=('==' | '!=' ) expression #binaryExpr
| <assoc=right> expression '=' expression #assignExpr
;
primary
: '(' expression ')'
| Identifier
| literal
;
literal
: DecimalInteger
;

BasicType: Int | Bool | String;
Int : 'int';
Bool : 'bool';
String : 'string';
If : 'if';
Else : 'else';
Return : 'return';
LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';
Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';
Plus : '+';
Minus : '-';
And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';
Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';
Assign : '=';
Equal : '==';
NotEqual : '!=';

Void : 'void';

Identifier
: [a-zA-Z] [a-zA-Z_0-9]*
;
DecimalInteger
: [1-9] [0-9]*
| '0'
;
Whitespace
: [ \t]+
-> skip
;
Newline
: ( '\r' '\n'?
| '\n'
)
-> skip
;
BlockComment
: '/*' .*? '*/'
-> skip
;
LineComment
: '//' ~[\r\n]*
-> skip
;