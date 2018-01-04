Desejamos parsear o arquivo *file.txt*

```
logging {
    category lame-servers { null; };
    category cname { null; };
};

zone "."
{
    type hint;
    file "/etc/bind/db.root";
};
```

Nós claramente percebemos as seguintes categorías(tokens) neste arquivo:

- WORDs, like "zone" and "type"
- FILENAMEs, like "/etc/bind/db.root"
- QUOTEs, like those surrounding the filename
- OBRACEs, {
- EBRACEs, }
- SEMICOLONs, ;


```
$ cat file.txt | ./exemplo

WORD OBRACE
WORD FILENAME OBRACE WORD SEMICOLON EBRACE SEMICOLON
WORD WORD OBRACE WORD SEMICOLON EBRACE SEMICOLON
EBRACE SEMICOLON

WORD QUOTE FILENAME QUOTE
OBRACE
WORD WORD SEMICOLON
WORD QUOTE FILENAME QUOTE SEMICOLON
EBRACE SEMICOLON
```
