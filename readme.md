<!-- badges: start -->
  [![Travis build status](https://travis-ci.com/common2016/CapitalStock.svg?branch=master)](https://travis-ci.com/common2016/CapitalStock)
  <!-- badges: end -->

### 1. 安装

```R
devtools::install_github('common2016/CapitalStock')
```

### 2. 使用

要计算国家层面的资本存量，[Penn World Table](https://www.rug.nl/ggdc/productivity/pwt/)很方便。本包是用张军等(2004)的方法计算各省1952-2017年的资本存量。后续有时间会增加其他资本存量算法。

如要计算陕西省和山西省1952-2017年的资本存量，可以输入命令，

```R
CompK(prv = 'shaanxi')
CompK(prv = 'shanxi')
```
因为陕西与山西的拼音一样，所以根据习惯用`shaanxi`表示陕西，`shanxi`表示山西。如果不想使用张军等(2004)建议的0.096的折旧率，想换个新的折旧率，譬如0.1，可以，
```R
CompK(prv = 'shan3xi',delta = 0.1)
```
想换个比如2000年作为价格指数基期重新算，可以，
```R
CompK(prv = 'shan3xi',delta = 0.1, bt = 2000)
```

如果你想计算北京2018年和2019年的资本存量，只要你有当前价的固定资本形成数据和以1952=1的固定资产投资价格指数数据，就能方便计算。但一般从数据库只能得到上年=100的固定资产投资价格指数，你可以通过如下命令查看你想要的省份在2017年时以1952=1的固定资产投资价格指数，如

```R
CompK(prv = 'beijing', bt = 1952)
#  prv   yr   K InvestPrice
#  ...
#  beijing 2016  29813   1.7845
#  beijing 2017  32506  1.8678
```



最后一列的最后一行就是北京2017年的1952=1的固定资产价格指数，然后通过Wind数据库查询到北京上年=100的固定资产投资价格指数为103和102.1，固定资本形成为10801和11100（我假设的）。那么，如下运算即可得到北京2018和2019的资本存量。

```R
CompK(yr = 2018:2019, invest = c(10801.2,11100),
      InvestPrice = c(1.86*1.03,1.86*1.03*1.021),
      prv = 'beijing',delta = 0.096)
```

如果算其他基期的后续资本存量，步骤类似，注意添加基期设置，如`bt = 2000`。


###  3. 一些说明
#### 3.1 四川和重庆

张军等(2004)计算四川的资本存量时把重庆是含在里面的，本包把它分开了。重庆的大部分数据在1996年以后才开始记录，因此，本包在计算重庆时，1996年的初始投资价格指数用四川的替代，之后用重庆的固定资产价格指数计算。1996年的初值资本存量用1995年重庆和四川的固定资本形成比例乘以1995年四川的资本存量，来获得。

#### 3.2 与张军等(2004)表2的差异

用本包计算出来的资本存量结果与张军等（2004）的表2进行比对，存在以下差异。

- 部分省份资本存量在1952年的初值就对不上。如北京、湖北和广东。初值比较简单，直接用固定资本形成乘以10就是初值，这里存在差异，比较费解。
- 湖北、广东差异较大，每年都不一样。山西虽然每年有点差异，但差异并不大。
- 部分省份在1995年以后有差异，如辽宁、贵州、陕西，江西，可能跟后来固定资产投资价格指数发生过调整有关(我的猜测)。

感兴趣的同行可以使用`data(asset)`来查看本包计算时用到的原始数据，如能找到差异原因所在，本包后续加以改进。

#### 3.3 其他小细节

- 西藏的固定资产价格指数到现在都没有，张军等(2004)也未在文中提到用的什么价格指数，我们发现1990年前用1，1991年以后用商品零售价格指数，算出的结果与张军等(2004)表2完美吻合。

- 海南基本建设投资数据在1952-1970年，多数年份是缺失的，张军等(2004)也未提到如何处理该情况。我们用五年计划的加总数据对缺失年份进行了平均，发现最终结果与张军等(2004)表2相差不大。




### 参考文献

[1].	张军, 吴桂英与张吉鹏, 中国省际物质资本存量估算:1952—2000. 经济研究, 2004(10): 第35-44页.
