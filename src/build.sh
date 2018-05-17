bison -dv wolfc.y
flex wolfc.l
cc -o wolfc y.tab.c lex.yy.c
