%option noyywrap

chiffre [0-9];
number [0-9]+;
floatt [0-9]*\.{number}(e[+-]?{number})?;
%% 
(for)|(while)|(if)|(else) printf("[mot-clefs]");
[=+*-] printf("[op]");
[(){};]|\[|\]  printf("[symboles]");
[a-zA-Z][a-zA-Z0-9]* printf("<%s>",yytext);
{number} printf("[int]");
{floatt} printf("[float]");
%%
int main(int argc,char*argv[])
{
    FILE*fil=NULL;
    if(argc>1){
        fil=fopen(argv[1],"r");
        if(!fil){
            printf("Erreur d'ouverture");
            exit(-1);
        }
        yyin=fil;
    }else yyin=stdin;
    yylex();
    if(fil)fclose(fil);
    return 0;
}