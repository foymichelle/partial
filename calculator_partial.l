%{
#include <stdlib.h>
#include "calculator_interpreter_partial.h"
#include "y.tab.h"

void yyerror(char *);
%}

%%

[ \t\n]+        ; /* whitespaces don't matter */

"print"         return PRT;

[=+;*\\%]       { return *yytext; }

[a-z]           { yylval.symbol_index = *yytext - 'a'; return VARIABLE; }

0               { yylval.input_Value = atoi(yytext); return INTEGER; }

[1-9][0-9]*     { yylval.input_Value = atoi(yytext); return INTEGER; }

.               yyerror("Character not in the alphabet");
%%

int yywrap(void) {
    return 1;
}
