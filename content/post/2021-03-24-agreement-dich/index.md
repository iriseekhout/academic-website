---
title: Agreement for dichotomous outcomes
author: "Iris Eekhout"
date: '2021-03-24'
slug: []
categories: []
tags:
  - Agreement
  - raters
subtitle: ''
summary: 'This document describes the use of the Agree package for the data example that was used in the paper on specific agreement on dichotomous outcomes in the situation of more than two raters.'
authors: []
lastmod: '2021-03-24T15:16:31+01:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: ["agreement"]
blogdown::html_page:
    toc: true
    fig_width: 6
    dev: "svg"
bibliography: [references.bib]
biblio-style: apalike
---

This document describes the use of the Agree package for the data example that was used in the paper on specific agreement on dichotomous outcomes in the situation of more than two raters. The method was fully explained an described in de Vet, Dikmans, and Eekhout (2017).

``` r
library(Agree)
```

    ## 
    ## Attaching package: 'Agree'

    ## The following object is masked from 'package:base':
    ## 
    ##     kappa

## Description of data example

For the data example we used data from a study by Dikmans et al. (2017). This data is based on photographs of breasts of 50 women after breast reconstruction. The photographs are independently scored by 5 surgeons, the patient, and three mothers. They each rated the quality of the reconstruction on a 5 point ordinal scale with the verbal anchors on the left side ‘very dissatisfied’ on the left end and on the right end ‘very satisfied’ on the right end. They specifically rated the volume, shape, symmetry, scars and nipple. In this paper we use the data of 4 surgeons because one surgeon had some missing values and we look at the rates for symmetry. The satisfaction scores were dichotomised into satisfied (scores 4 and 5) and not satisfied (scores 1,2, and 3).

``` r
data(breast)
variable <- "symmetry"
raters <- c("PCH1", "PCH2", "PCH3", "PCH4")
ratersvars <- paste(raters, variable, sep="_")
data1 <- data.frame(breast[ratersvars])
 for (r in 1:length(ratersvars)){
    data1[ratersvars[r]] <- ifelse(data1[ratersvars[r]]=="very satisfied"|data1[ratersvars[r]]=="satisfied","satisfied","not satisfied")
 }
data1 <- data.frame(apply(data1[ratersvars], 2, as.factor), stringsAsFactors = TRUE)

head(data1)
```

    ##   PCH1_symmetry PCH2_symmetry PCH3_symmetry PCH4_symmetry
    ## 1     satisfied     satisfied     satisfied     satisfied
    ## 2 not satisfied not satisfied not satisfied not satisfied
    ## 3     satisfied not satisfied not satisfied not satisfied
    ## 4 not satisfied not satisfied not satisfied not satisfied
    ## 5 not satisfied     satisfied not satisfied     satisfied
    ## 6     satisfied not satisfied     satisfied     satisfied

### Agreement table

First the agreement tables are summed for all rater combinations into one agreement table. Then the off diagonal cells are averaged to obtain symmetry agreement tables. Note that data1 contains a column per rater for the variable of interest.

``` r
sumtable(data1,offdiag = FALSE) %>% kable()
```

|               | not satisfied | satisfied |
|:--------------|--------------:|----------:|
| not satisfied |           106 |        42 |
| satisfied     |            34 |       118 |

``` r
sumtable(data1,offdiag = TRUE) %>% kable()
```

|               | not satisfied | satisfied |
|:--------------|--------------:|----------:|
| not satisfied |           106 |        38 |
| satisfied     |            38 |       118 |

### Agreement

From the agreement table we can calculate the agreement. And we can calculate the confidence interval around this agreement.

``` r
agreement(data1)
```

    ## overall agreement 
    ##         0.7466667

``` r
agreement(data1, confint = TRUE)
```

    ## overall agreement             lower             upper 
    ##         0.7466667         0.6608408         0.8215369

### Specific agreement

The specific agreement for dichotomous data can be evaluated for the satisfied scores and for the not satisfied scores.

``` r
agreement(data1, specific="satisfied", confint = TRUE)
```

    ##                                       p     lower     upper
    ## overall agreement             0.7466667 0.6608408 0.8215369
    ## specific agreement: satisfied 0.7564103 0.6407977 0.8505168

``` r
agreement(data1, specific="not satisfied", confint = TRUE)
```

    ##                                           p     lower     upper
    ## overall agreement                 0.7466667 0.6608408 0.8215369
    ## specific agreement: not satisfied 0.7361111 0.6156558 0.8355576

### Validation of Confidence interval

Simulation to compare the Fleis correction

Follows….

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-devet2017" class="csl-entry">

de Vet, H. C. W., R. E. Dikmans, and I Eekhout. 2017. “Specific Agreement on Dichotomous Outcomes Can Be Calculated for More Than Two Raters.” *Journal of Clinical Epidemiology* 83: 85–89. <https://www.jclinepi.com/article/S0895-4356(16)30837-X/abstract>.

</div>

<div id="ref-dikmans2017" class="csl-entry">

Dikmans, R. E., L. Nene, M. B. Bouman, H. C. W. de Vet, M. Mireau, M. E. Buncamper, H. Winters, M. Ritt, and M. G. Mullender. 2017. “[The Aesthetic Items Scale: A Tool for the Evaluation of Aesthetic Outcome After Breast Reconstruction]().” *Plastic and Reconstructive Surgery. Global Open.* 5 (3): e1254.

</div>

</div>
