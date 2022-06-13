grammar Sped;

// Lexer

//Arithmetic operators
//In case of a sole statement it is an assignment, else it is an comparison
//NOT as an assignement ( X!7 ) makes x something, that is not 7
PLUS
  : '+'
MINUS
  : '-'
MULTIPLY
  : '*'
DIVIDE
  : '/'
MODULO
  : '%'
POWER
  : '^'
EQUAL
  : '='
MORE
  : '>'
LESS
  : '<'
NOT
  : '!'


//Flow operators
// ?condition{if true}{if false}
IF
 : '?'
// §Condition{while true}
// §ElementList{for each}
LOOP
 : '§'
//A block structures flow units or smth like that
STARTBLOCK
 : '{'
ENDBLOCK
 : '}'
//NEXT seperates statements
NEXT
 : '$'
//RETURN oldschool assign to functionname

//Variables
SYMBOL
 : [A-Z][a-z]*
ACCESS
 : '.'



// ELSE can be used after loops?
 
//Other
COMMENT
 : '#'


OPERATOR
  : [+-/*%] ;
COMPARISON_OPERATOR
  : ('==='|'=='|'!=') ;
ASSIGNEMENT_OPERATOR
  : '=' ;
TERMINATOR
  : ';' ;
NUMBER
  : [0-9]+ ;
SEPERATOR
  : [ \t] -> skip ;
NEWLINE
  : [\r\n]+ -> skip;
LITERAL
  : ["'] ;
ROUNDOPENBRACKET
  : '(' ;
ROUNDCLOSEBRACKET
  : ')' ;
KEYWORD
  : ('var'|'function'|'return') ;
IDENTIFIER
  : [a-zA-Z][a-zA-Z0-9]* ;

// Parser

code
  : line* EOF;
line
  : statement TERMINATOR ;
statement
  : constant
  | IDENTIFIER
  | bracketed_statement
  | ( (constant | IDENTIFIER | bracketed_statement) OPERATOR statement);
bracketed_statement
  : ROUNDOPENBRACKET statement ROUNDCLOSEBRACKET;
constant
  : NUMBER;
