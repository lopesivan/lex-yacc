## Usando lex

```
$ cat idade.txt |./exemplo
225
```

## Usando o comando grep

```
$ grep -E '[0-9]+' idade.txt
  - Maria tem 40 anos;
  - Jorge tem 49 anos;
  - Carla tem 68 anos;
  - Sílvio tem 12 anos;
  - Gomes tem 34 anos;
  - Pablo tem 22 anos.

$ grep -Eo '[0-9]+' idade.txt
40
49
68
12
34
22

$ grep -Eo '[0-9]+' idade.txt| paste -sd+
40+49+68+12+34+22
```


## Usando o comando sed

```
$ sed -n 's/.* \([0-9]\+\) .*/A idade é: \1/p' idade.txt
A idade é: 40
A idade é: 49
A idade é: 68
A idade é: 12
A idade é: 34
A idade é: 22

$ sed -n 's/.* \([0-9]\+\) .*/\1/p' idade.txt| paste -s
40      49      68      12      34      22

$ sed -n 's/.* \([0-9]\+\) .*/\1/p' idade.txt| paste -s  -d+
40+49+68+12+34+22

$ sed -n 's/.* \([0-9]\+\) .*/\1/p' idade.txt| paste -sd+
40+49+68+12+34+22

$ sed -n 's/.* \([0-9]\+\) .*/\1/p' idade.txt| paste -sd+ | bc
225
```


## Usando o comando awk
```
$ awk '{ match($0, /([0-9]+)/, arr);
         if(arr[1] != "") s+=arr[1]
       }
       END{print s}' idade.txt
```
