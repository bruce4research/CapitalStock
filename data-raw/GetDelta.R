rm(list = ls())
library(ggplot2)
library(reshape2)
# library(CHNCapitalStock)
library(stringr)
library(magrittr)

# 将各省每年折旧数据添加进0.0.2版本的asset
depr <- openxlsx::read.xlsx('data-raw/固定资产折旧.xlsx',1,detectDates = T)
depr <- melt(depr,id.vars = '指标名称',value.name = 'depr',variable.name = 'prv')
depr$prv <- str_split_fixed(depr$prv,':',3) %>% .[,1]
depr$yr <- format(depr$指标名称,'%Y')
ans <- openxlsx::read.xlsx('E:\\27_MyRPackages\\CapitalStock\\data-raw/各地区固定资本生产总额及指数.xlsx',2)
prv <- ans
depr <- merge(depr, ans, by = 'prv', all.x = T) %>% dplyr::select(-prv,-指标名称) %>%
  dplyr::rename(prv = alphabets)
data("asset")
asset <- merge(asset, depr, by = c('prv','yr'), all.x = T)

use_data(asset, overwrite = T)
