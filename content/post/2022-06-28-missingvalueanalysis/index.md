---
title: Missing value analysis
author: ''
date: '2022-06-28'
slug: []
categories: []
tags:
  - Multiple imputation
  - missing data
  - mice
  - missing data patterns
  - missing value analysis
subtitle: ''
summary: ''
authors: []
lastmod: '2022-06-28T17:42:57+02:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: ["dmo"]
blogdown::html_page:
    toc: true
    fig_width: 6
    dev: "svg"
---




Missing observations are defined as `NA` in R. Missing data can have different implications for data summaries, analyses and conclusions based on the data with missing values. In this post, different types of missing data are reviewed and explored in data examples.

In the example data that is generated with the `mvrnorm` function from the `MASS` package, there are missing values created with the  `MCAR` function from the `dmo` package. The missing data are created completely at random. 



```r
cov <- matrix(c(rep(0.7, 25)), nrow = 5)
diag(cov) <- 1
dat <- MASS::mvrnorm(n = 25, rep(0,5), Sigma = cov)

patterns <- matrix(c(0,1,1,0,0,
                     1,0,1,1,0), nrow = 2, byrow = T)
set.seed(23421)
datm <- dmo::MCAR(data.frame(dat), alpha = 0.50, pattern = patterns, f = c(0.5, 0.5))
datm
```

```
##             X1          X2          X3          X4         X5
## 1   0.03171897          NA  0.51519352  0.58704105         NA
## 2   0.26520707  0.39506482  0.52760629  0.55414615  1.5665120
## 3  -1.45709838 -2.73838940 -1.75597262 -2.45787213 -1.7018803
## 4           NA  0.95370823 -0.32336260          NA         NA
## 5   0.84274205  1.75490850  1.71902929  2.16406360  1.5941273
## 6           NA  0.38979708  0.04017497          NA         NA
## 7   1.22752263 -0.22951222  0.83671660 -0.57939518  1.0845183
## 8  -0.75294132          NA -0.26910147  0.04683022         NA
## 9  -0.68053351          NA  0.02569744  0.07078761         NA
## 10  0.11989344  0.66374253  0.29686346 -0.48592098  0.1334693
## 11  0.72261525  0.13160966  2.04251460  1.32357921  1.0491106
## 12  0.63191703  0.53621249  1.05299434  0.85228559  0.5154174
## 13          NA -0.45843092 -1.21177465          NA         NA
## 14  0.14245597          NA  0.38837706 -0.01602952         NA
## 15 -1.10704551          NA -0.24278478 -1.84681124         NA
## 16 -0.84678003 -0.66010016 -0.44981819 -0.12750964 -0.4373756
## 17  0.38717946  1.14825931  1.89290296  0.76840888  1.4901767
## 18  1.10010145  1.24947067 -0.19115926 -0.24792977  1.0619460
## 19          NA  2.29089347  2.63532668          NA         NA
## 20 -0.71007077  0.09190102 -0.03605369 -0.39051473  0.3900112
## 21 -1.28368724 -1.86824089 -1.17572698 -1.63678815 -1.4074415
## 22  0.17999122          NA  0.04663481 -1.08420947         NA
## 23  1.20954740 -0.38811127 -0.35744216 -0.37982822  0.3078492
## 24  1.43506975 -0.09778116 -0.45761173  0.09264308 -0.5321164
## 25 -0.73064513 -0.35714543 -0.74840159 -0.02218715 -0.3455592
```


## Explore the amount of missing data

The amount of missing data can be expressed from different points of views. We can count the number of missing entries in the entire data by using the `is.na` function. In total there are 24 missing data entries. The data frame contains 5 variables for 25 subjects, which makes a total of 125 data entries. Accordingly, 19.2% of the data entries are missing.  


```r
sum(is.na(datm))
```

```
## [1] 24
```

```r
sum(is.na(datm))/length(is.na(datm)) * 100
```

```
## [1] 19.2
```

Another way is to look at the amount of missing data, is to summarize the missing observations per variable. For each variable we can count the number of missing observations (n) and calculate the proportion (p)


```r
datm %>%
  is.na %>%
  data.frame() %>%
  summarise_all(list(n = sum, p = mean)) %>%
  pivot_longer(everything(), 
               names_to = c("variable", ".value"),
               names_pattern = "(.*)_(.)")
```

```
## # A tibble: 5 × 3
##   variable     n     p
##   <chr>    <int> <dbl>
## 1 X1           4  0.16
## 2 X2           6  0.24
## 3 X3           0  0   
## 4 X4           4  0.16
## 5 X5          10  0.4
```

When data with missing values are analyzed, many analysis methods only use the rows that have are fully observed. This is called a complete-case analysis. The data are then *listwise* deleted. To analyze the implications of the missing values in the data for this analysis strategy we have to evaluate the number of rows that contain missing values and the rows that contain no missing values.


```r
datm %>% 
  is.na %>%
  data.frame() %>%
  mutate(n_miss = rowSums(.),
         missing = ifelse(n_miss > 0, "rows with misings", "rows without missing")) %>%
  group_by(missing) %>%
  summarise(n = n(),
            p = n/ 25)
```

```
## # A tibble: 2 × 3
##   missing                  n     p
##   <chr>                <int> <dbl>
## 1 rows with misings       10   0.4
## 2 rows without missing    15   0.6
```

The `cci` function in the `mice` package creates and indicator for the number of fully observed rows. 


```r
mice::cci(datm)
```

```
##  [1] FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
## [13] FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
## [25]  TRUE
```

The `nic` function in the `mice` package counts the number of incomplete cases, i.e. cases with missing values. 


```r
mice::nic(datm)
```

```
## [1] 10
```

The `ncc` function in the `mice` package counts the number of complete cases, i.e. cases full fully observed rows.

```r
mice::ncc(datm)
```

```
## [1] 15
```



## Missing data patterns

A missing data pattern is the combination of observed an unobserved values that occur together in a row. A missing data pattern is generally notated as having a 0 for a missing value and a 1 for an observed value. The data often contains multiple different missing data patterns. The way we generated the missing data in our example will show three missing data patterns in the data. The first pattern is where the data are fully observed, so a row of only ones. The second pattern has three variables observed ant two missing and the thirds has three missing values and two observed. The `md.pattern` function from the `mice` package displays the missing data patterns in the data. The row-names show the number of times the pattern occurs in the data. The final column shows the number missing values the missing data pattern holds. 


```r
mice::md.pattern(datm, plot= F)
```

```
##    X3 X1 X4 X2 X5   
## 15  1  1  1  1  1  0
## 6   1  1  1  0  0  2
## 4   1  0  0  1  0  3
##     0  4  4  6 10 24
```


The missing data patterns can also be shows per variable pair. The number of times two variables are either missing together or observed together can inform us about how many cases we can actually use for imputation. The `md.pair` function from the `mice` package shows four matrices. Each matrix gives us information about combinations of missing values in our data. 

* `rr`: response-response, the count of how often two variables are both observed.
* `rm`: response-missing, the count of how often the row-variable is observed and the column-variable is missing.
* `mr`: missing-response, the count of how often the row-variable is missing and the column-variable is observed.
* `mm`: missing-missing, the count of how often two variables are both missing. 


```r
pat <- mice::md.pairs(datm)
pat
```

```
## $rr
##    X1 X2 X3 X4 X5
## X1 21 15 21 21 15
## X2 15 19 19 15 15
## X3 21 19 25 21 15
## X4 21 15 21 21 15
## X5 15 15 15 15 15
## 
## $rm
##    X1 X2 X3 X4 X5
## X1  0  6  0  0  6
## X2  4  0  0  4  4
## X3  4  6  0  4 10
## X4  0  6  0  0  6
## X5  0  0  0  0  0
## 
## $mr
##    X1 X2 X3 X4 X5
## X1  0  4  4  0  0
## X2  6  0  6  6  0
## X3  0  0  0  0  0
## X4  0  4  4  0  0
## X5  6  4 10  6  0
## 
## $mm
##    X1 X2 X3 X4 X5
## X1  4  0  0  4  4
## X2  0  6  0  0  6
## X3  0  0  0  0  0
## X4  4  0  0  4  4
## X5  4  6  0  4 10
```


The proportion missing-response from the sum of the missing-response and missing-missing matrices shows how many usable cases the data have to impute the row variable from the column variable. 


```r
round(100 * pat$mr / (pat$mr + pat$mm))
```

```
##     X1  X2  X3  X4  X5
## X1   0 100 100   0   0
## X2 100   0 100 100   0
## X3 NaN NaN NaN NaN NaN
## X4   0 100 100   0   0
## X5  60  40 100  60   0
```
*Note that X3 does not have any missing data*

## Types of missing data

In research, missing data occur when a data value is unavailable. Many empirical studies encounter missing data. Missing data can occur in many stages of research due to many different causes in many different forms. 

Missing data can occur because an invited respondent does not participate in the study: *non-response*. In case of *non-response* there is often no information available about the respondents that did not participate, besides the information used to select study participants.

Missing data can take place on one or more of the measured variables that are used as a predictor, covariate or outcome. This is often referred to as *intermittend missing data*. 

When participants in a longitudinal study do not show up at one or more repeated measurement occasions, the missing data are often referred to as *drop-out* or *loss to follow up*. 

Each type of missing data may have different reasons, and also different implication for the methods to deal with the missing data. 

