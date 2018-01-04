Digamos que temos um termostato que queremos controlar usando um idioma
simples. Uma sessão do termostato poderia se parecer com isto:

```
calor Ligado
    Aquecedor Ligado!
calor Desligado
    Aquecedor Desligado!
alvo temperatura 22
    Novo ajuste de temperatura!
```


Os tokens que precisamos reconhecer são: calor, ligar / desligar (STATE),
alvo, temperatura, NÚMERO.

