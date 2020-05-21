rm(list = ls())
devtools::load_all()
delta <- 0.096
prv <- '安徽'

CompK(yr = 2018:2019, invest = c(10801.2,11100),
      InvestPrice = c(1.86*1.03,1.86*1.03*1.021),
      prv = '北京',delta = 0.096)
CompK(prv = '北京') %$% .[yr == 1952 | yr == 1960,]
CompK(prv = '新疆') %$% .[yr == 1952 | yr == 1960 | yr == 1970 | yr == 1978 | yr == 1985 |
                          yr == 1990 | yr == 1995 | yr == 1998 | yr == 2000,]
