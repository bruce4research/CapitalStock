rm(list = ls())
devtools::load_all()

anhui <- CompK(prv = 'anhui')

p <- ggplot2::ggplot(anhui, aes_string(x = 'yr', y = 'K')) + ggplot2::geom_line() +
  ggplot2::labs(x = 'year') + ggplot2::theme_bw()
p

CompK(yr = 2018:2019, invest = c(10801.2,11100),
      InvestPrice = c(1.86*1.03,1.86*1.03*1.021),
      prv = 'beijing',delta = 0.096)
CompK(prv = 'chongqing') %$% .[yr == 1952 | yr == 1960,]
CompK(prv = 'hebei', bt = 2000) %$% .[yr == 1952 | yr == 1960 | yr == 1970 | yr == 1978 | yr == 1985 |
                          yr == 1990 | yr == 1995 | yr == 1998 | yr == 2000,]

