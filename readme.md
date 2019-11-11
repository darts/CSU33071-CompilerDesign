# **Compiling**  
## **Just lex files:**
On MacOS:
```
> flex FILENAME.l
> gcc lex.yy.c -ll
```

On Linux (and probably windows):
```
> flex FILENAME.l
> gcc lex.yy.c -lfl
```

## **Flex and Bison**
On MacOX:
```
> flex FILENAME.l
> bison -d OTHER_FILE.y
> gcc OTHER_FILE.tab.h lex.yy.c -ll
```
I presume the procedure is similar on Linux and Windows but I haven't checked. 
<br><br>

From there: run the `a.out` file created, with your desired input.