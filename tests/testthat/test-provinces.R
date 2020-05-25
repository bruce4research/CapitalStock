library(magrittr)
test_that('Compute capital stock in Beijing province in China',{
  expect_equal((CompK(prv = 'beijing', bt = 2000) %$% .[yr == 2000,'K']),7066.979, tolerance = 0.01)
  expect_equal((CompK(prv = 'beijing', bt = 1952) %$% .[yr == 1952,'K']),7.9, tolerance = 0.01)
})

test_that('Compute capital stock in Chongqing province in China',{
  expect_equal((CompK(prv = 'chongqing', bt = 2000) %$% .[yr == 2000,'K']),2143.611, tolerance = 0.01)
  expect_equal((CompK(prv = 'chongqing', bt = 1952) %$% .[yr == 1997,'K']),434.2679, tolerance = 0.01)
})
