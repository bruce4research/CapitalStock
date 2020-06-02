## Resubmission
This is a resubmission. In this version I have add the methods in my package in the DESCRIPTION file as follows:
- Description: Compute Chinese capital stocks in provinces level, based on Zhang (2008) <DOI:10.1080/14765280802028302>. 

We submit the package which only includes one function, there are some reasons as follow:
- There are lots of missing data in computing the Chinese capital stock before 1978, furthermore, many data is in paper forms before 1978. In many cases the same method (for example, Zhang (2004)) was used, the computed capital stock is very different. Data processing may be a primary cause. With the data processing methods by Zhang (2008),  all available data are encapsulated in the package, and then the method computing capital stock also encapsulated in the package. The appearance of the package would make the research in the related fields more possibly be repeated, and furthermore we should add others more methods in the package in future.

## Test environments
 * local Windows 10, R 4.0.0
 * Ubuntu 16.04.6  (on travis-ci),  devel and release
 * Windows Server 2008 R2 SP1(on rhub), devel
 * Dedora Linux (on rhub), devel

## R CMD check results
There were no ERRORs and WARNINGs.

There was 1 NOTE:

```
checking CRAN incoming feasibility ... NOTE
Maintainer: 'Pu Chen <shengnehs@qq.com>'

New submission
```

This is my first submission for the package.