%option noyywrap
chiffre [0-9]
number {chiffre}+
frac [.]{number}
Exp ([Ee][+-]?{number})
Reel {number}{frac}?{Exp}?
%%
for|while|if|else printf("[mot-clefs]");
[=+*<>-] printf("[op]");
[;(){}]|\[|\]  printf("[symboles]");
[a-zA-Z][a-zA-Z0-9]* printf("<%s>",yytext);
{number} printf("[int]");
{Reel} printf("[float]");
. printf("%c",yytext[0]);
%%
int main(int argc,char*argv[])
{
    FILE*fil=NULL;
    if(argc>1)
    {
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