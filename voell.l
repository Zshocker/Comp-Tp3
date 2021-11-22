%option noyywrap
lettersB [B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]*
motA {lettersB}[aA]{lettersB}[eE]{lettersB}[iI]{lettersB}[oO]{lettersB}[Uu]{lettersB}
motB (a[ab]*)|([ab]*a)
motC (a(ba)*)|(b(ab)*)
motD b*(a*(bb+)?)*b*
%%
{motA} printf("[motA]");
{motB} printf("[motB]");
{motC} printf("[motC]");
{motD} printf("[motD]");
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