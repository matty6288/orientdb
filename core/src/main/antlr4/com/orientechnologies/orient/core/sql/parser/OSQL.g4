grammar OSQL;

options {
    language = Java;
}

//-----------------------------------------------------------------//
// LEXER
//-----------------------------------------------------------------//


// KEYWORDS -------------------------------------------
SELECT : S E L E C T ;
INSERT : I N S E R T ;
UPDATE : U P D A T E ;
CREATE : C R E A T E ;
DELETE : D E L E T E ;
FROM : F R O M ;
WHERE : W H E R E ;
INTO : I N T O ;
DROP : D R O P ;
FORCE : F O R C E ;
VALUES : V A L U E S ;
SET : S E T ;
ADD : A D D ;
REMOVE : R E M O V E ;
AND : A N D ;
OR : O R ;
ORDER : O R D E R ;
BY : B Y ;
LIMIT : L I M I T ;
LIKE : L I K E ;
RANGE : R A N G E ;
ASC : A S C ;
AS : A S;
DESC : D E S C ;
OTHIS : '@' T H I S ;
ORID_ATTR: '@' R I D ;
OCLASS_ATTR: '@' C L A S S ;
OVERSION_ATTR: '@' V E R S I O N ;
OSIZE_ATTR: '@' S I Z E ;
OTYPE_ATTR: '@' T Y P E ;
CLUSTER : C L U S T E R ;
DATABASE : D A T A B A S E ;
PROPERTY : P R O P E R T Y ;
TRUNCATE : T R U N C A T E ;
EXTENDS : E X T E N D S ;
ABSTRACT : A B S T R A C T ;
RECORD : R E C O R D ;
INDEX : I N D E X ;
DICTIONARY : D I C T I O N A R Y ;
ALTER : A L T E R ;
CLASS : C L A S S ;
SKIP : S K I P ;
GRANT : G R A N T ;
REVOKE : R E V O K E ;
IN : I N ;
ON : O N ;
TO : T O ;
IS : I S ;
NOT : N O T ;
GROUP : G R O U P ;
DATASEGMENT : D A T A S E G M E N T ;
LOCATION : L O C A T I O N ;
POSITION : P O S I T I O N ;
RUNTIME : R U N T I M E ;
EDGE : E D G E ;
FUNCTION : F U N C T I O N ;
LINK : L I N K ;
VERTEX : V E R T E X ;
TYPE : T Y P E ;
INVERSE : I N V E R S E ;
IDEMPOTENT : I D E M P O T E N T ;
LANGUAGE : L A N G U A G E ;

// GLOBAL STUFF ---------------------------------------
COMMA 	: ',';
DOUBLEDOT 	: ':';
DOT 	: '.';
WS  :   ( ' ' | '\t' | '\r'| '\n' ) -> skip ;

// math operations
UNARY : '+' | '-' ;
MULT : '*';
DIV : '/';
COMPARE_EQL     : '='  ;
COMPARE_INF     : '<'  ;
COMPARE_SUP     : '>'  ;
COMPARE_INF_EQL : '<=' ;
COMPARE_SUP_EQL : '>=' ;
COMPARE_DIF     : '!=' | '<>' ;

    
// case insensitive
fragment A: ('a'|'A');
fragment B: ('b'|'B');
fragment C: ('c'|'C');
fragment D: ('d'|'D');
fragment E: ('e'|'E');
fragment F: ('f'|'F');
fragment G: ('g'|'G');
fragment H: ('h'|'H');
fragment I: ('i'|'I');
fragment J: ('j'|'J');
fragment K: ('k'|'K');
fragment L: ('l'|'L');
fragment M: ('m'|'M');
fragment N: ('n'|'N');
fragment O: ('o'|'O');
fragment P: ('p'|'P');
fragment Q: ('q'|'Q');
fragment R: ('r'|'R');
fragment S: ('s'|'S');
fragment T: ('t'|'T');
fragment U: ('u'|'U');
fragment V: ('v'|'V');
fragment W: ('w'|'W');
fragment X: ('x'|'X');
fragment Y: ('y'|'Y');
fragment Z: ('z'|'Z');
fragment DIGIT : '0'..'9' ;
fragment LETTER : ~('0'..'9' | ' ' | '\t' | '\r'| '\n' | ',' | '-' | '+' | '*' | '/' | '(' | ')' | '{' | '}' | '[' | ']'| '=' | '.'| ':' | '#');

LPAREN : '(';
RPAREN : ')';
LBRACKET : '[';
RBRACKET : ']';
LACCOLADE : '{';
RACCOLADE : '}';
    

//LITERALS  ----------------------------------------------

UNSET : '?';
NULL : N U L L ;
ORID : '#';

TEXT : ('\'' ( ESC_SEQ | '\'\'' | ~('\\'|'\'') )* '\'') ;

INT : DIGIT+ ;
FLOAT
    :   ('0'..'9')+ '.' ('0'..'9')* EXPONENT? ('d'|'f')?
    |   '.' ('0'..'9')+ EXPONENT? ('d'|'f')?
    |   ('0'..'9')+ EXPONENT ('d'|'f')?
    | INT ('d'|'f')
    ;

WORD : LETTER (DIGIT|LETTER)* ;
ESCWORD : ('"'  ( ESC_SEQ | ~('\\'|'"' ) )* '"' ) ;



// FRAGMENT -------------------------------------------

fragment EXPONENT : ('e'|'E') ('+'|'-')? ('0'..'9')+ ;
fragment HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;
    
 
    
    
//-----------------------------------------------------------------//
// PARSER
//-----------------------------------------------------------------//
    
keywords    
  : SELECT
  | INSERT
  | UPDATE
  | CREATE
  | DELETE
  | FROM
  | WHERE
  | INTO
  | DROP
  | FORCE
  | VALUES
  | SET
  | ADD
  | REMOVE
  | AND
  | OR
  | ORDER
  | BY
  | LIMIT
  | LIKE
  | RANGE
  | ASC
  | AS
  | DESC
  | OTHIS
  | ORID_ATTR
  | OCLASS_ATTR
  | OVERSION_ATTR
  | OSIZE_ATTR
  | OTYPE_ATTR
  | CLUSTER
  | DATABASE
  | PROPERTY
  | TRUNCATE
  | EXTENDS
  | ABSTRACT
  | RECORD
  | INDEX
  | DICTIONARY
  | ALTER
  | CLASS
  | SKIP
  | GRANT
  | REVOKE
  | IN
  | ON
  | TO
  | IS
  | NOT
  | GROUP
  | DATASEGMENT
  | LOCATION
  | POSITION
  | RUNTIME
  | EDGE
  | FUNCTION
  | LINK
  | VERTEX
  | TYPE
  | INVERSE
  | IDEMPOTENT
  | LANGUAGE 
  ;
reference   : WORD | ESCWORD | keywords;
orid        : ORID INT ':' INT;
unset       : UNSET | (DOUBLEDOT reference);
number    	: (UNARY^)? (INT|FLOAT)	;
map         : LACCOLADE (literal DOUBLEDOT expression (COMMA literal DOUBLEDOT expression)*)? RACCOLADE ;
collection  : LBRACKET (expression (COMMA expression)*)? RBRACKET ;
literal	
  : NULL
  | TEXT
	| number
	;

arguments   : LPAREN (expression (COMMA expression)*)? RPAREN ;
functionCall: reference arguments ;
methodCall  : DOT reference arguments* ;

expression
  : literal
  | map
  | collection
  | orid
  | unset
  | reference
  | LPAREN expression RPAREN
  | functionCall
  | expression methodCall
  ;

filterAnd : AND filter ;
filterOr : OR filter ;
filterIn : IN (literal|collection|commandSelect) ;
filter
  : LPAREN filter RPAREN
  | filter filterAnd
  | filter filterOr
  | expression filterIn
  | NOT filter
  | expression COMPARE_EQL     expression
  | expression COMPARE_INF     expression
  | expression COMPARE_SUP     expression
  | expression COMPARE_INF_EQL expression
  | expression COMPARE_SUP_EQL expression
  | expression COMPARE_DIF     expression
  | expression IS NULL
  | expression IS NOT NULL
  | expression LIKE expression
  ;

// COMMANDS

cword : anything | NULL ;
anything : .*? ;

commandUnknowned : expression (expression)* ;

commandInsertIntoByValues
  : INSERT INTO ((CLUSTER|INDEX) DOUBLEDOT)? reference insertCluster? insertFields VALUES insertSource
  ;
commandInsertIntoBySet
  : INSERT INTO ((CLUSTER|INDEX) DOUBLEDOT)? reference insertCluster? SET insertSet (COMMA insertSet)*
  ;
insertSource 
  : commandSelect
  | LPAREN insertSource RPAREN
  | insertEntry (COMMA insertEntry)*
  ;
insertCluster : CLUSTER reference ;
insertEntry   : LPAREN expression (COMMA expression)* RPAREN ;
insertSet     : reference COMPARE_EQL expression ;
insertFields  : LPAREN reference(COMMA reference)* RPAREN ;

commandSelect
  : SELECT (projection (COMMA projection)*)? from (WHERE filter)? groupBy? orderBy? skip? limit?
  ;
projection
  : ( MULT
    | expression
    | filter
    | ORID_ATTR
    | OCLASS_ATTR
    | OVERSION_ATTR
    | OSIZE_ATTR
    | OTYPE_ATTR ) 
    (alias)?
  ;
alias          : AS reference ;
from           
  : FROM 
    ( ((CLUSTER|INDEX|DICTIONARY) DOUBLEDOT)? reference
    | orid
    | collection
    | commandSelect
    | LPAREN commandSelect RPAREN ) 
  ;
groupBy        : GROUP BY expression (COMMA expression)* ;
orderBy        : ORDER BY orderByElement (COMMA orderByElement)* ;
orderByElement : expression (ASC|DESC)? ;
skip           : SKIP INT ;
limit          : LIMIT INT ;

commandCreateClass      : CREATE CLASS reference (EXTENDS reference)? (CLUSTER numberOrWord(COMMA numberOrWord)*)? ABSTRACT?;
numberOrWord : number | reference ;
commandCreateCluster    : CREATE CLUSTER reference reference (DATASEGMENT reference)? (LOCATION reference)? (POSITION reference)? ;
commandCreateIndex      : CREATE INDEX reference (indexOn)? reference (NULL | RUNTIME INT | (reference (COMMA reference)*))?;
indexOn : ON reference LPAREN reference (COMMA reference)* RPAREN ;
commandCreateProperty   : CREATE PROPERTY reference DOT reference reference reference?;
commandCreateEdge       : CREATE EDGE reference? (edgeCluster)? FROM edgeEnd TO edgeEnd (SET insertSet (COMMA insertSet)*)?;
edgeCluster : CLUSTER reference ;
edgeEnd : orid | collection | commandSelect ;
commandCreateFunction   : CREATE FUNCTION reference TEXT (IDEMPOTENT reference)? (LANGUAGE reference)? ;
commandCreateLink       : CREATE LINK linkName? (TYPE reference)? FROM reference DOT reference TO reference DOT reference INVERSE?;
linkName : reference ;
commandCreateVertex     : CREATE VERTEX reference (CLUSTER reference)? (SET insertSet (COMMA insertSet)*)?;

commandAlterClass       : ALTER CLASS reference reference cword ;
commandAlterCluster     : ALTER CLUSTER (reference|number) reference cword;
commandAlterDatabase    : ALTER DATABASE reference cword;
commandAlterProperty    : ALTER PROPERTY reference DOT reference reference cword ;

commandDropClass        : DROP CLASS reference ;
commandDropCluster      : DROP CLUSTER reference ;
commandDropIndex        : DROP INDEX reference ;
commandDropProperty     : DROP PROPERTY reference DOT reference FORCE ;

commandTruncateClass    : TRUNCATE CLASS reference ;
commandTruncateCluster  : TRUNCATE CLUSTER reference ;
commandTruncateRecord   : TRUNCATE RECORD (orid|collection) ;

commandGrant            : GRANT reference ON reference TO reference ;
commandRevoke           : REVOKE reference ON reference FROM reference ;

command
	: (commandCreateClass
  | commandCreateCluster
  | commandCreateIndex
  | commandCreateProperty
  | commandCreateEdge
  | commandCreateFunction
  | commandCreateLink
  | commandCreateVertex
  | commandAlterClass
  | commandAlterCluster
  | commandAlterDatabase
  | commandAlterProperty
  | commandDropClass
  | commandDropCluster
  | commandDropIndex
  | commandDropProperty
  | commandInsertIntoByValues
  | commandInsertIntoBySet
  | commandSelect
  | commandTruncateClass
  | commandTruncateCluster
  | commandTruncateRecord
  | commandGrant
  | commandRevoke)
    EOF
  ;