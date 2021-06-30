
library("ggplot2")
library("tidyverse")
library("reshape2")
library("qgraph")
library("ggfortify")
library("ltm")
library("pheatmap")

dados = read.csv("dados.csv", header = TRUE)
levels(dados$Escola) = c("Escola A", "Escola B")
dados$Série = factor(dados$Série, levels = c(6, 7, 8, 9, 1))
levels(dados$Série) = paste0(levels(dados$Série), "º ano")
dados$Turma = factor(paste(dados$Série, str_to_upper(as.character(dados$Turma))),
                     levels = c("6º ano A", "6º ano B","7º ano A","7º ano B","7º ano C",
                                "7º ano E","8º ano A","8º ano C","9º ano B","9º ano C",
                                "1º ano A","1º ano B"))

pontuacoes = read.csv("pontuacoes.csv", header = TRUE)
pontuacoes$Total = apply(pontuacoes[,2:26], 1, sum)
pontuacoes$Grau = factor(ceiling(pontuacoes$Total/25), levels = c(1, 2, 3, 4, 5))
levels(pontuacoes$Grau) = c("Nenhuma Ansiedade",
                            "Baixa Ansiedade",
                            "Ansiedade Moderada",
                            "Alta Ansiedade",
                            "Extrema Ansiedade")

dados = left_join(dados, pontuacoes) %>%
  filter(!is.na(X1))
n_meninos = sum(dados$Gênero == "M" & !is.na(dados$X1))
n_meninas = sum(dados$Gênero == "F" & !is.na(dados$X1))

cores_grau = c("#619CFF","#00BA38", "#F8766D")
cores_genero = c("#9D6FB1", "#83B16F")
cores_escola = c("#d1d22f", "#d2822f")
cores_serie = c("#DD4201", "#f1b399", 
                "#135718", "#239c2b", "#67c66e", "#bee6c0", 
                "#238391", "#84d6e2",
                "mediumorchid1", "mediumorchid3",
                "palevioletred1", "palevioletred3")
cores_serie2 = c("#DD4201", "#67c66e", "#84d6e2", "mediumorchid1", "palevioletred1")

df_grau = dados %>%
  group_by(Grau) %>%
  summarise(n = n())

df_idade_escolar = dados %>%
  group_by(Grau, Idade, Gênero, Série) %>%
  summarise(n = n()) %>%
  mutate(IdadeEscolar = as.integer(str_sub(Série, 1, 1))) %>%
  mutate(IdadeEscolar = ifelse(IdadeEscolar == 1, 10, IdadeEscolar) + 6) %>%
  mutate(Dentro = ifelse(Idade <= IdadeEscolar, "Sim", "Não"))

medias = apply(dados[8:32], 2, sum) / nrow(dados)
medias

questoes = 8:32
cronbach.alpha(as.matrix(dados[,questoes]), CI = TRUE)

fem = dados$Total[which(dados$Gênero == "F")]
mas = dados$Total[which(dados$Gênero == "M")]
t.test(fem, mas)

dados %>%
    group_by(Gênero) %>%
    summarise(media = mean(Total), dp = sd(Total), quantidade = n())

H = dados$Total[which(dados$Escola == "Escola A")]
N = dados$Total[which(dados$Escola == "Escola B")]
t.test(H, N)

dados %>%
    group_by(Escola) %>%
    summarise(media = mean(Total), dp = sd(Total), quantidade = n())

Idade = as.factor(dados$Idade)
Total = dados$Total
dados2 = data.frame(Idade, Total)

modelo.anova = lm(Total ~ Idade, data = dados2)
summary(modelo.anova)

anova(modelo.anova)

dados2 %>%
    group_by(Idade) %>%
    summarise(media = mean(Total), dp = sd(Total), quantidade = n())

Série = as.factor(dados$Série)
Total = dados$Total
dados3 = data.frame(Série, Total)

modelo.anova = lm(Total ~ Série, data = dados3)
summary(modelo.anova)

anova(modelo.anova)

dados3 %>%
    group_by(Série) %>%
    summarise(media = mean(Total), dp = sd(Total), quantidade = n())

Turma = as.factor(dados$Turma)
Total = dados$Total
dados4 = data.frame(Turma, Total)

modelo.anova = lm(Total ~ Turma, data = dados4)
summary(modelo.anova)

anova(modelo.anova)

dados4 %>%
    group_by(Turma) %>%
    summarise(media = mean(Total), dp = sd(Total), quantidade = n())

mean(dados$Total)
sd(dados$Total)
nrow(dados)
