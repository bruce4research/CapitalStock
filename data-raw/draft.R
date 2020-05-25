rm(list = ls())
devtools::load_all()



CompK(yr = 2018:2019, invest = c(10801.2,11100),
      InvestPrice = c(1.86*1.03,1.86*1.03*1.021),
      prv = 'beijing',delta = 0.096)
CompK(prv = 'shan3xi') %$% .[yr == 1952 | yr == 1960,]
CompK(prv = 'hebei', bt = 2000) %$% .[yr == 1952 | yr == 1960 | yr == 1970 | yr == 1978 | yr == 1985 |
                          yr == 1990 | yr == 1995 | yr == 1998 | yr == 2000,]
