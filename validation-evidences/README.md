# Likert-type survey - validation evidences
   ## Languages
   This first section is in English. 
   
   [Versão em português logo abaixo.](#portuguese)
   
   ## Context
   Here are some code snippets generated in this research, focusing on statistical validation of the survey used.

The main objective in this stage was to carry out some survey validation studies, such as the *KMO* and *Bartlett* tests, in addition to the *Confirmatory Factor Analysis (CFA)*. Even though it was a *relatively small* number of participants, it was a survey with a large number of deaf students and that **represented a good portion of this population** of the total population surveyed in this specific context.

## Confidentiality of data and code
This research was approved by the Brazilian research ethics committee (REC), guaranteeing the anonymity of the data. Because of this, and because part of the findings of this research have not yet been published, I decided to only include code snippets of this findings, but without uploading the complete work.
   
   ## Some highlights of the research findings
 The Likert-type survey used in this research is the result of another larger study of the *Escala de Ansiedade à Matemática - EAM (or in English: Math Anxiety Scale)*, with the main researcher being ```Prof. Dr. João dos Santos Carmo```, in this version translated into Brazilian Sign Language (Libras) from Portuguese (with an adapted printed version with graphic representations to support the research), with the main researchers being ```Prof. Dr. Lara Ferreira dos Santos``` and ```Prof. Dr. Marcus Vinícius Batista Nascimento```.

In order to assess whether the constructs of this version of the EAM translated into Libras remained as observed in the original version, a statistical validation study of this new application was conducted, seeking evidence of validation.

Thus, the model of constructs used for this was the same as that adopted in the original research, below is an excerpt from the code, using the R *lavaan* package:

```R
library(lavaan)

data = left_join(data, scores) %>%
filter(!is.na(X1))

model= 'F1 =~ X7 + X8 + X13 + X15 + X17 + X18 + X21 + X22 + X24 + X25
F2 =~ X1 + X2 + X4 + X5 + X6 + X9 + X10 + X14 + X16 + X20 + X23'

cfa1= cfa(model, data=data)

summary(cfa1, standardized=FALSE, fit.measures=TRUE)
```

As noted in [this report analysis](./Análises%20Fatoriais%20Confirmatorias%20-%20AFC.pdf), we can observe that the data do indeed seem to demonstrate evidence of validation of these constructs from Confirmatory Factor Analysis of the data obtained from this application of the translated version of the EAM translated into Libras.

## Reference materials
If you are interested in learning about the ["Escala de Ansiedade à Matemática - EAM (or, in English: Math Anxiety Scale)"](https://repositorio.ufscar.br/bitstream/handle/ufscar/8416/TeseACM.pdf?sequence=1&isAllowed=y), or its [translated version into Brazilian Sign Language (Libras)](https://repositorio.ufscar.br/handle/ufscar/14164?show=full), feel free to access these links in Portuguese for that purpose.
   
   ## Technologies used
  In this project, the ```R``` statistical programming language and ```Jupyter Notebooks``` were used to access and document the codes.
   
   ____
   <br>
   
   # <p id="portuguese">Survey tipo Likert - evidências de validação</p>
   ## Contexto
   Aqui tenho alguns trechos de código geradas nesta pesquisa, com enfoque em validação estatística da survey utilizada.
 
   O principal objetivo nesta etapa era realizar alguns estudos de validação de survey, como os testes de *KMO* e *Bartlett*, além da *Análise Fatorial Confirmatória (AFC ou, em inglês: CFA)*. Mesmo sendo um número *relativamente pequeno* do total de participantes, foi uma pesquisa com um grande número de estudantes surdos e que **representava uma boa parcela dessa população** da população total pesquisada neste determinado contexto.
   
   ## Sigilo dos dados e código
   Está pesquisa foi aprovada pelo comitê de ética em pesquisa, garantindo o anonimato dos dados. Por conta disso, e de que parte dos achados dessa pesquisa ainda não foram publicados, decidi trazer apenas trechos do código elaborado para compor essa narrativa dos dados, mas sem divulgar o trabalho completo.
   
   ## Alguns destaques dos achados da pesquisa
   A survey tipo likert utilizada nesta pesquisa é fruto de uma outra pesquisa maior da Escala de Ansiedade à Matemática, tendo como principal pesquisador o ```Prof. Dr. João dos Santos Carmo```, nesta versão traduzida para a Libras do Português (com uma versão impressa adaptada com representações gráficas), tendo como principais pesquisadores a ```Prof. Dr. Lara Ferreira dos Santos``` e o ```Prof. Dr. Marcus Vinícius Batista Nascimento```. 
   
   Para avaliar se os construtos desta versão traduzida para a Libras da Escala de Ansiedade à Matemática se mantinham como observados na versão original, foi feito um estudo de validação estatística dessa nova aplicação, buscando evidências de validação.

   Deste modo, o modelo de construtos utilizados para isso foi o mesmo que adotado na pesquisa original, segue trecho do código, utilizando o pacote *lavaan* do R:
   
```R
library(lavaan)

dados = left_join(dados, pontuacoes) %>%
    filter(!is.na(X1))

modelo= 'F1 =~ X7 + X8 + X13 + X15 + X17 + X18 + X21 + X22 + X24 + X25
F2 =~ X1 + X2 + X4 + X5 + X6 + X9 + X10 + X14 + X16 + X20 + X23'

cfa1= cfa(modelo, data=dados)

summary(cfa1, standardized=FALSE, fit.measures=TRUE)
```
   
 Como observado no [relatório desta análise](./Análises%20Fatoriais%20Confirmatorias%20-%20AFC.pdf), podemos observar que os dados parecem demonstrar sim evidências de validação destes construtos a partir de Análise Fatorial Confirmatória dos dados obtidos a partir dessa aplicação da versão traduzida da Escala de Ansiedade à Matemática traduzida para a Libras.

 ## Materiais de consulta
 Caso tenha interesse em conhecer a [Escala de Ansiedade à Matemática](https://repositorio.ufscar.br/bitstream/handle/ufscar/8416/TeseACM.pdf?sequence=1&isAllowed=y), ou sua [versão traduzida para a Libras](https://repositorio.ufscar.br/handle/ufscar/14164?show=full), fique a vontade para acessar estes links para isso.
 
   ## Tecnologias utilizadas
   Neste projeto, foram utilizados a linguagem ```R``` de programação estatística e os ```Jupyter Notebooks``` para acesso e documentação dos códigos.
   