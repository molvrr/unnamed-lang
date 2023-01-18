# Linguagem sem nome
Repositório criado com o objetivo de estudar criação de linguagens. A ideia é fazer uma linguagem extremamente simples, com suporte apenas a variáveis, tipos simples e operações básicas.

Ps: O código escrito aqui provavelmente vai ser muito ruim.

## Sintaxe
let a = 10

let b = a + 2

### Operadores
`+ - * /`

### Tipos

#### Decimais
0.1, 1.5, 2.52, etc.

#### Inteiros
1, 2, 3, etc.

#### Strings
"Olá, mundo"

"Olá,


Mundo"
## Regras (rascunho)
**start**: **expr**

**expr**: **expr_0** | **expr_1**

**expr_0**: "let" WORD "=" **expr_1**

**expr_1**: INT | STRING | **op** | DECIMAL

**oprd**: INT | WORD | DECIMAL

**optn**: **oprd** **opr** **oprd**

**opr**: "+" | "-" | "*" | "/"
