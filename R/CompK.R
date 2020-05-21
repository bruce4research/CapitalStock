#' Compute Capital Stock
#'
#' This function compute capital stock of provinces in China using Zhang et al. (2004).
#' Note the capital stock is real economic variable, its price is 1 in 1952.
#' @param yr a numeric vector about years. If you only need capital stock before 2017,
#'  you can use its default. If you need to compute capital stocks in other
#'  years (for example 2018,2019), you can set, for example, \code{yr = c(2018,2019)}.
#' @param invest a numeric vector about investment, its length equal the length of
#' \code{yr}, and its units is 100 million in current price.
#' @param InvestPrice a numeric vector about price indices of investment,
#' its length equal the length of \code{yr}, and it is a fixed base index
#' with equaling 1 in 1952.
#' @param delta rate of depreciation, a scalar number.
#' @param prv a province name, a scalar character.
#' @note The parameter\code{InvestPrice} is a fixed base index with equaling 1 in 1952.
#' However, we often only get a price indices of investment with equaling 1
#' in last year. You can use \code{data(asset)} to get \code{InvestPrice}
#' in any year (before 2017) with equaling 1 in 1952. So, it is easy then.
#' @return The function return a data.frame, and its 1st coloume is province, 2nd column
#'    is year, 3rd column is capital stock.
#' @examples
#' # Compute capital stock in Xinjiang province in 1952-2017
#' CompK(prv = '新疆')
#' # compute capital stock in Beijing in 2018 and 2019
#' CompK(yr = 2018:2019, invest = c(10801.2,11100),
#'    InvestPrice = c(1.86*1.03,1.86*1.03*1.021),
#'    prv = '北京',delta = 0.096)
#' # ...
#' # 北京 2018 35023.74246
#' # 北京 2019 37336.21755
#' @export
#' @import magrittr

CompK <- function(yr = NULL, invest = NULL, InvestPrice = NULL,
                  delta = 0.096, prv){
  if (!is.null(yr)){
    asset <- data.frame(prv = prv, yr = yr, invest = invest,
               InvestIndex = NA, InvestPrice = InvestPrice) %>%
      rbind(asset[asset$yr < min(yr),], .)
    asset <- dplyr::arrange(asset, prv, yr)
  }

  K <- asset[asset$yr == 1952,c('prv','yr','invest')]
  K$K <- K$invest/0.1
  asset <- merge(asset, K[,c('prv','yr','K')], by = c('prv','yr'), all.x = T)
  asset$RealInvest <- asset$invest/asset$InvestPrice
  ans <- asset[asset$prv %in% prv,]
  if (prv %in% '重庆') ans$K[1] <- 1090*313/850

  for (i in 2:nrow(ans)) {
    ans$K[i] <- ans$K[i-1] * (1-delta) + ans$RealInvest[i]
  }
  return(ans[,c('prv','yr','K')])
}
