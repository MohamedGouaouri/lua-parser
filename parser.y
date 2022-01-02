
%token ID
%token SEMICOLON ";"
%token ASSIGN "="
%token COMMA ","
%token do, 
        end, 
        repeat, 
        until, 
        if, 
        then, 
        elseif, 
        else,
        for,
        in,
        function,
        local,
        return,
        break
%%
chunk : stat opt_semicolon chunk opt_last
        | stat chunk opt_last
        ;

block : chunk;

opt_semicolon: 
            | ";"
            ;


stat: varlist "=" explist
    | functioncall
    | do block end
    | repeat block until exp
    | if exp then block elseifs elseblock end
    | for ID "=" exp "," exp lastforexp do block end
    | for namelist in explist do block end
    | function funcname funcbody
    | local function funcname funcbody
    | local namelist opt_assign
    ;

opt_assign:
    | "=" explist
    ;

lastforexp: "," exp
        |
        ;

elseifs: 
        |elseif exp then block elseifs
        ;

elseblock: 
        |else block
        ;


laststat: return opt_explist | break
    ;
opt_explist:
            | explist
            ;

funcname: ID

functioncall:;



opt_last: 
        |laststat opt_semicolon
        ;

namelist:;

funcbody:;

varlist:;
explist:;
exp:;
%%