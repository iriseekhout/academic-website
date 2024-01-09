---
title: Agreement for polytomous outcomes
author: 'Iris Eekhout'
date: '2021-03-24'
slug: []
categories: []
tags:
  - Agreement
  - raters
subtitle: ''
summary: 'This document describes the use of the Agree package for two data examples that are used in the paper on specific agreement on polytomous outcomes in the situation of more than two raters. The first data example is an example of ordinal ratings and the second example of nominal rating. '
authors: []
lastmod: '2021-03-24T14:33:58+01:00'
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

This document describes the use of the Agree package for two data examples that are used in the paper on specific agreement on polytomous outcomes in the situation of more than two raters (de Vet, Mullender, and Eekhout 2018). The first data example is an example of ordinal ratings and the second example of nominal rating.

``` r
library(Agree)
```

    ## 
    ## Attaching package: 'Agree'

    ## The following object is masked from 'package:base':
    ## 
    ##     kappa

## Ordinal data example

For the ordinal data example we use data from a study by Dikmans et al. (2017). This data is based on photographs of breasts of 50 women after breast reconstruction. The photographs are independently scored by 5 surgeons, the patients, and three mothers. They each rated the quality of the reconstruction on a 5 point ordinal scale with the verbal anchors on the left side ‘very dissatisfied’ on the left end and on the right end ‘very satisfied’ on the right end. They specifically rated the volume, shape, symmetry, scars and nipple. In this paper we use the data of 4 surgeons because one surgeon had some missing values and we look at the rates for symmetry. Data set 1 is used for the example of ordinal categories.

``` r
data(breast)

variable <- "symmetry"
raters <- c("PCH1", "PCH2", "PCH3", "PCH4")
ratersvars <- paste(raters, variable, sep="_")
data1 <- data.frame(breast[ratersvars])

data1 %>% head()
```

    ##       PCH1_symmetry  PCH2_symmetry PCH3_symmetry PCH4_symmetry
    ## 1         satisfied very satisfied     satisfied     satisfied
    ## 2           neutral        neutral  dissatisfied       neutral
    ## 3         satisfied        neutral       neutral       neutral
    ## 4      dissatisfied        neutral  dissatisfied  dissatisfied
    ## 5 very dissatisfied      satisfied  dissatisfied     satisfied
    ## 6         satisfied        neutral     satisfied     satisfied

### Agreement table

First the agreement table are summed for all rater combinations into one agreement table. Then the off diagonal cells are averaged to obtain symmetry agreement tables.

``` r
sumtable(data1,offdiag = FALSE) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
very dissatisfied
</th>
<th style="text-align:right;">
dissatisfied
</th>
<th style="text-align:right;">
neutral
</th>
<th style="text-align:right;">
satisfied
</th>
<th style="text-align:right;">
very satisfied
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
very dissatisfied
</td>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
dissatisfied
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
19
</td>
<td style="text-align:right;">
23
</td>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
1
</td>
</tr>
<tr>
<td style="text-align:left;">
neutral
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
18
</td>
<td style="text-align:right;">
39
</td>
<td style="text-align:right;">
27
</td>
<td style="text-align:right;">
4
</td>
</tr>
<tr>
<td style="text-align:left;">
satisfied
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
28
</td>
<td style="text-align:right;">
28
</td>
<td style="text-align:right;">
16
</td>
</tr>
<tr>
<td style="text-align:left;">
very satisfied
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
36
</td>
<td style="text-align:right;">
38
</td>
</tr>
</tbody>
</table>

``` r
sumtable(data1,offdiag = TRUE) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
very dissatisfied
</th>
<th style="text-align:right;">
dissatisfied
</th>
<th style="text-align:right;">
neutral
</th>
<th style="text-align:right;">
satisfied
</th>
<th style="text-align:right;">
very satisfied
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
very dissatisfied
</td>
<td style="text-align:right;">
6.0
</td>
<td style="text-align:right;">
0.5
</td>
<td style="text-align:right;">
0.0
</td>
<td style="text-align:right;">
1.0
</td>
<td style="text-align:right;">
0.0
</td>
</tr>
<tr>
<td style="text-align:left;">
dissatisfied
</td>
<td style="text-align:right;">
0.5
</td>
<td style="text-align:right;">
19.0
</td>
<td style="text-align:right;">
20.5
</td>
<td style="text-align:right;">
6.0
</td>
<td style="text-align:right;">
0.5
</td>
</tr>
<tr>
<td style="text-align:left;">
neutral
</td>
<td style="text-align:right;">
0.0
</td>
<td style="text-align:right;">
20.5
</td>
<td style="text-align:right;">
39.0
</td>
<td style="text-align:right;">
27.5
</td>
<td style="text-align:right;">
3.0
</td>
</tr>
<tr>
<td style="text-align:left;">
satisfied
</td>
<td style="text-align:right;">
1.0
</td>
<td style="text-align:right;">
6.0
</td>
<td style="text-align:right;">
27.5
</td>
<td style="text-align:right;">
28.0
</td>
<td style="text-align:right;">
26.0
</td>
</tr>
<tr>
<td style="text-align:left;">
very satisfied
</td>
<td style="text-align:right;">
0.0
</td>
<td style="text-align:right;">
0.5
</td>
<td style="text-align:right;">
3.0
</td>
<td style="text-align:right;">
26.0
</td>
<td style="text-align:right;">
38.0
</td>
</tr>
</tbody>
</table>

### Agreement

From the agreement table we can calculate the agreement. And we can calculate the confidence interval around this agreement.

``` r
agreement(data1)
```

    ## overall agreement 
    ##         0.4333333

``` r
agreement(data1, confint = TRUE)
```

    ## overall agreement             lower             upper 
    ##         0.4333333         0.3286321         0.5434725

### Specific agreement

The specific agreement for polytomous data, can be defined in two ways: the agreement of for one category versus not that category (e.g. very satisfied versus all other categories) or the agreement for one category versus any other (e.g. very satistfied versus satisfied). Below the Confidence intervals for the specific agreements are bootstrapped.

``` r
agreement(data1, specific="satisfied", confint = TRUE)
```

    ##                                       p     lower     upper
    ## overall agreement             0.4333333 0.3286321 0.5434725
    ## specific agreement: satisfied 0.3163842 0.2307576 0.4058084

``` r
agreement(data1, specific=c("satisfied", "very satisfied"), confint = TRUE)
```

    ##                                                         p     lower     upper
    ## overall agreement                               0.4333333 0.3286321 0.5434725
    ## specific agreement: satisfied vs very satisfied 0.5185185 0.3839506 0.6518599

``` r
agreement(data1, specific= c("satisfied","neutral"), confint = TRUE)
```

    ##                                                  p     lower     upper
    ## overall agreement                        0.4333333 0.3286321 0.5434725
    ## specific agreement: satisfied vs neutral 0.5045045 0.3716486 0.6207280

### Conditional probability

We can calulate the probability of any other outcome conditional on an specific outcome.

``` r
conditional.agreement(data1) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
prevalence
</th>
<th style="text-align:right;">
proportion
</th>
<th style="text-align:right;">
very dissatisfied
</th>
<th style="text-align:right;">
dissatisfied
</th>
<th style="text-align:right;">
neutral
</th>
<th style="text-align:right;">
satisfied
</th>
<th style="text-align:right;">
very satisfied
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
very dissatisfied
</td>
<td style="text-align:right;">
7.5
</td>
<td style="text-align:right;">
0.025
</td>
<td style="text-align:right;">
0.800
</td>
<td style="text-align:right;">
0.067
</td>
<td style="text-align:right;">
0.000
</td>
<td style="text-align:right;">
0.133
</td>
<td style="text-align:right;">
0.000
</td>
</tr>
<tr>
<td style="text-align:left;">
dissatisfied
</td>
<td style="text-align:right;">
46.5
</td>
<td style="text-align:right;">
0.155
</td>
<td style="text-align:right;">
0.011
</td>
<td style="text-align:right;">
0.409
</td>
<td style="text-align:right;">
0.441
</td>
<td style="text-align:right;">
0.129
</td>
<td style="text-align:right;">
0.011
</td>
</tr>
<tr>
<td style="text-align:left;">
neutral
</td>
<td style="text-align:right;">
90.0
</td>
<td style="text-align:right;">
0.300
</td>
<td style="text-align:right;">
0.000
</td>
<td style="text-align:right;">
0.228
</td>
<td style="text-align:right;">
0.433
</td>
<td style="text-align:right;">
0.306
</td>
<td style="text-align:right;">
0.033
</td>
</tr>
<tr>
<td style="text-align:left;">
satisfied
</td>
<td style="text-align:right;">
88.5
</td>
<td style="text-align:right;">
0.295
</td>
<td style="text-align:right;">
0.011
</td>
<td style="text-align:right;">
0.068
</td>
<td style="text-align:right;">
0.311
</td>
<td style="text-align:right;">
0.316
</td>
<td style="text-align:right;">
0.294
</td>
</tr>
<tr>
<td style="text-align:left;">
very satisfied
</td>
<td style="text-align:right;">
67.5
</td>
<td style="text-align:right;">
0.225
</td>
<td style="text-align:right;">
0.000
</td>
<td style="text-align:right;">
0.007
</td>
<td style="text-align:right;">
0.044
</td>
<td style="text-align:right;">
0.385
</td>
<td style="text-align:right;">
0.563
</td>
</tr>
</tbody>
</table>

### Weighted agreement

For ordinal data it might also be useful to look at the agreement when they may be one category off. So the agreement plus or minus one category, that categories is weighted (default weight=1).

``` r
weighted.agreement(data1)
```

    ## [1] 0.93

``` r
weighted.agreement(data1, weight=0.5)
```

    ## [1] 0.6816667

## nominal data example

For the nominal data example we use a data set that was used in a paper by Fleis (1971). In this data patients are diagnosed in 5 categories: Depression, Personality Disorder, Schizophrenia, Neurosis, and Other by 6 raters.

``` r
data(diagnoses) 
data2 <- data.frame(lapply(diagnoses,as.factor), stringsAsFactors = TRUE)

 levels(data2$rater1) <- c("Depression", "Pers disord.", "Schizophrenia", "Neurosis", "Other")
 levels(data2$rater2) <- c("Depression", "Pers disord.", "Schizophrenia", "Neurosis", "Other")
 levels(data2$rater3) <- c("Depression", "Pers disord.", "Schizophrenia", "Neurosis", "Other")
 levels(data2$rater4) <- c("Depression", "Pers disord.", "Schizophrenia", "Neurosis", "Other")
 levels(data2$rater5) <- c("Depression", "Pers disord.", "Schizophrenia", "Neurosis", "Other")
```

### Agreement table

First the agreement table are summed for all rater combinations into one agreement table. Then the off diagonal cells are averaged to obtain symmetry agreement tables.

``` r
sumtable(data2,offdiag = FALSE) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
Depression
</th>
<th style="text-align:right;">
Pers disord.
</th>
<th style="text-align:right;">
Schizophrenia
</th>
<th style="text-align:right;">
Neurosis
</th>
<th style="text-align:right;">
Other
</th>
<th style="text-align:right;">

2.  Personality Disorder
    </th>
    <th style="text-align:right;">

    3.  Schizophrenia
        </th>
        <th style="text-align:right;">

        4.  Neurosis
            </th>
            <th style="text-align:right;">

            5.  Other
                </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <td style="text-align:left;">
                Depression
                </td>
                <td style="text-align:right;">
                23
                </td>
                <td style="text-align:right;">
                1
                </td>
                <td style="text-align:right;">
                11
                </td>
                <td style="text-align:right;">
                20
                </td>
                <td style="text-align:right;">
                1
                </td>
                <td style="text-align:right;">
                4
                </td>
                <td style="text-align:right;">
                3
                </td>
                <td style="text-align:right;">
                9
                </td>
                <td style="text-align:right;">
                8
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Pers disord.
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                23
                </td>
                <td style="text-align:right;">
                6
                </td>
                <td style="text-align:right;">
                17
                </td>
                <td style="text-align:right;">
                5
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                3
                </td>
                <td style="text-align:right;">
                13
                </td>
                <td style="text-align:right;">
                8
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Schizophrenia
                </td>
                <td style="text-align:right;">
                7
                </td>
                <td style="text-align:right;">
                4
                </td>
                <td style="text-align:right;">
                36
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                2
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                6
                </td>
                <td style="text-align:right;">
                2
                </td>
                <td style="text-align:right;">
                12
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Neurosis
                </td>
                <td style="text-align:right;">
                10
                </td>
                <td style="text-align:right;">
                16
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                53
                </td>
                <td style="text-align:right;">
                1
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                24
                </td>
                <td style="text-align:right;">
                6
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Other
                </td>
                <td style="text-align:right;">
                8
                </td>
                <td style="text-align:right;">
                5
                </td>
                <td style="text-align:right;">
                6
                </td>
                <td style="text-align:right;">
                2
                </td>
                <td style="text-align:right;">
                43
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                0
                </td>
                <td style="text-align:right;">
                22
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">

                2.  Personality Disorder
                    </td>
                    <td style="text-align:right;">
                    1
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    <td style="text-align:right;">
                    0
                    </td>
                    </tr>
                    <tr>
                    <td style="text-align:left;">

                    3.  Schizophrenia
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        3
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        <td style="text-align:right;">
                        0
                        </td>
                        </tr>
                        <tr>
                        <td style="text-align:left;">

                        4.  Neurosis
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            <td style="text-align:right;">
                            1
                            </td>
                            <td style="text-align:right;">
                            1
                            </td>
                            <td style="text-align:right;">
                            10
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            <td style="text-align:right;">
                            0
                            </td>
                            </tr>
                            <tr>
                            <td style="text-align:left;">

                            5.  Other
                                </td>
                                <td style="text-align:right;">
                                1
                                </td>
                                <td style="text-align:right;">
                                0
                                </td>
                                <td style="text-align:right;">
                                3
                                </td>
                                <td style="text-align:right;">
                                3
                                </td>
                                <td style="text-align:right;">
                                7
                                </td>
                                <td style="text-align:right;">
                                0
                                </td>
                                <td style="text-align:right;">
                                0
                                </td>
                                <td style="text-align:right;">
                                0
                                </td>
                                <td style="text-align:right;">
                                0
                                </td>
                                </tr>
                                </tbody>
                                </table>

``` r
sumtable(data2,offdiag = TRUE) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
Depression
</th>
<th style="text-align:right;">
Pers disord.
</th>
<th style="text-align:right;">
Schizophrenia
</th>
<th style="text-align:right;">
Neurosis
</th>
<th style="text-align:right;">
Other
</th>
<th style="text-align:right;">

2.  Personality Disorder
    </th>
    <th style="text-align:right;">

    3.  Schizophrenia
        </th>
        <th style="text-align:right;">

        4.  Neurosis
            </th>
            <th style="text-align:right;">

            5.  Other
                </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <td style="text-align:left;">
                Depression
                </td>
                <td style="text-align:right;">
                23.0
                </td>
                <td style="text-align:right;">
                0.5
                </td>
                <td style="text-align:right;">
                9.0
                </td>
                <td style="text-align:right;">
                15.0
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                <td style="text-align:right;">
                2.5
                </td>
                <td style="text-align:right;">
                1.5
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Pers disord.
                </td>
                <td style="text-align:right;">
                0.5
                </td>
                <td style="text-align:right;">
                23.0
                </td>
                <td style="text-align:right;">
                5.0
                </td>
                <td style="text-align:right;">
                16.5
                </td>
                <td style="text-align:right;">
                5.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                1.5
                </td>
                <td style="text-align:right;">
                7.0
                </td>
                <td style="text-align:right;">
                4.0
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Schizophrenia
                </td>
                <td style="text-align:right;">
                9.0
                </td>
                <td style="text-align:right;">
                5.0
                </td>
                <td style="text-align:right;">
                36.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                4.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                <td style="text-align:right;">
                1.5
                </td>
                <td style="text-align:right;">
                7.5
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Neurosis
                </td>
                <td style="text-align:right;">
                15.0
                </td>
                <td style="text-align:right;">
                16.5
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                53.0
                </td>
                <td style="text-align:right;">
                1.5
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                17.0
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Other
                </td>
                <td style="text-align:right;">
                4.5
                </td>
                <td style="text-align:right;">
                5.0
                </td>
                <td style="text-align:right;">
                4.0
                </td>
                <td style="text-align:right;">
                1.5
                </td>
                <td style="text-align:right;">
                43.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                0.0
                </td>
                <td style="text-align:right;">
                14.5
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">

                2.  Personality Disorder
                    </td>
                    <td style="text-align:right;">
                    2.5
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    <td style="text-align:right;">
                    0.0
                    </td>
                    </tr>
                    <tr>
                    <td style="text-align:left;">

                    3.  Schizophrenia
                        </td>
                        <td style="text-align:right;">
                        1.5
                        </td>
                        <td style="text-align:right;">
                        1.5
                        </td>
                        <td style="text-align:right;">
                        4.5
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        <td style="text-align:right;">
                        0.0
                        </td>
                        </tr>
                        <tr>
                        <td style="text-align:left;">

                        4.  Neurosis
                            </td>
                            <td style="text-align:right;">
                            4.5
                            </td>
                            <td style="text-align:right;">
                            7.0
                            </td>
                            <td style="text-align:right;">
                            1.5
                            </td>
                            <td style="text-align:right;">
                            17.0
                            </td>
                            <td style="text-align:right;">
                            0.0
                            </td>
                            <td style="text-align:right;">
                            0.0
                            </td>
                            <td style="text-align:right;">
                            0.0
                            </td>
                            <td style="text-align:right;">
                            0.0
                            </td>
                            <td style="text-align:right;">
                            0.0
                            </td>
                            </tr>
                            <tr>
                            <td style="text-align:left;">

                            5.  Other
                                </td>
                                <td style="text-align:right;">
                                4.5
                                </td>
                                <td style="text-align:right;">
                                4.0
                                </td>
                                <td style="text-align:right;">
                                7.5
                                </td>
                                <td style="text-align:right;">
                                4.5
                                </td>
                                <td style="text-align:right;">
                                14.5
                                </td>
                                <td style="text-align:right;">
                                0.0
                                </td>
                                <td style="text-align:right;">
                                0.0
                                </td>
                                <td style="text-align:right;">
                                0.0
                                </td>
                                <td style="text-align:right;">
                                0.0
                                </td>
                                </tr>
                                </tbody>
                                </table>

### Agreement

From the agreement table we can calculate the agreement. And we can calculate the confidence interval around this agreement.

``` r
agreement(data2, confint = TRUE)
```

    ## overall agreement             lower             upper 
    ##         0.3955556         0.2805873         0.5200202

### Specific agreement

The specific agreement for polytomous data, can be defined in two ways: the agreement of for one category versus not that category (e.g. Depression versus all other categories) or the agreement for one category versus any other (e.g. Depression versus Schizophrenia). The confidence intervals for specific agreement are bootstrapped.

``` r
agreement(data2, specific="Depression", confint = TRUE)
```

    ##                                        p     lower     upper
    ## overall agreement              0.3955556 0.2805873 0.5200202
    ## specific agreement: Depression 0.3538462 0.1230000 0.5161988

``` r
agreement(data2, specific="Pers disord.", confint = TRUE)
```

    ##                                          p     lower     upper
    ## overall agreement                0.3955556 0.2805873 0.5200202
    ## specific agreement: Pers disord. 0.3680000 0.1777778 0.5419355

``` r
agreement(data2, specific="Schizophrenia", confint = TRUE)
```

    ##                                           p     lower     upper
    ## overall agreement                 0.3955556 0.2805873 0.5200202
    ## specific agreement: Schizophrenia 0.5333333 0.3692308 0.6667647

``` r
agreement(data2, specific="Neurosis", confint = TRUE)
```

    ##                                      p     lower     upper
    ## overall agreement            0.3955556 0.2805873 0.5200202
    ## specific agreement: Neurosis 0.4930233 0.3764137 0.5857143

``` r
agreement(data2, specific="Other", confint = TRUE)
```

    ##                                   p     lower     upper
    ## overall agreement         0.3955556 0.2805873 0.5200202
    ## specific agreement: Other 0.5931034 0.2997222 0.7393939

### Conditional agreement

``` r
conditional.agreement(data2) %>% kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:right;">
prevalence
</th>
<th style="text-align:right;">
proportion
</th>
<th style="text-align:right;">
Depression
</th>
<th style="text-align:right;">
Pers disord.
</th>
<th style="text-align:right;">
Schizophrenia
</th>
<th style="text-align:right;">
Neurosis
</th>
<th style="text-align:right;">
Other
</th>
<th style="text-align:right;">

2.  Personality Disorder
    </th>
    <th style="text-align:right;">

    3.  Schizophrenia
        </th>
        <th style="text-align:right;">

        4.  Neurosis
            </th>
            <th style="text-align:right;">

            5.  Other
                </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                <td style="text-align:left;">
                Depression
                </td>
                <td style="text-align:right;">
                65.0
                </td>
                <td style="text-align:right;">
                0.1444444
                </td>
                <td style="text-align:right;">
                0.354
                </td>
                <td style="text-align:right;">
                0.008
                </td>
                <td style="text-align:right;">
                0.138
                </td>
                <td style="text-align:right;">
                0.231
                </td>
                <td style="text-align:right;">
                0.069
                </td>
                <td style="text-align:right;">
                0.038
                </td>
                <td style="text-align:right;">
                0.023
                </td>
                <td style="text-align:right;">
                0.069
                </td>
                <td style="text-align:right;">
                0.069
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Pers disord.
                </td>
                <td style="text-align:right;">
                62.5
                </td>
                <td style="text-align:right;">
                0.1388889
                </td>
                <td style="text-align:right;">
                0.008
                </td>
                <td style="text-align:right;">
                0.368
                </td>
                <td style="text-align:right;">
                0.080
                </td>
                <td style="text-align:right;">
                0.264
                </td>
                <td style="text-align:right;">
                0.080
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.024
                </td>
                <td style="text-align:right;">
                0.112
                </td>
                <td style="text-align:right;">
                0.064
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Schizophrenia
                </td>
                <td style="text-align:right;">
                67.5
                </td>
                <td style="text-align:right;">
                0.1500000
                </td>
                <td style="text-align:right;">
                0.133
                </td>
                <td style="text-align:right;">
                0.074
                </td>
                <td style="text-align:right;">
                0.533
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.059
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.067
                </td>
                <td style="text-align:right;">
                0.022
                </td>
                <td style="text-align:right;">
                0.111
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Neurosis
                </td>
                <td style="text-align:right;">
                107.5
                </td>
                <td style="text-align:right;">
                0.2388889
                </td>
                <td style="text-align:right;">
                0.140
                </td>
                <td style="text-align:right;">
                0.153
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.493
                </td>
                <td style="text-align:right;">
                0.014
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.158
                </td>
                <td style="text-align:right;">
                0.042
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">
                Other
                </td>
                <td style="text-align:right;">
                72.5
                </td>
                <td style="text-align:right;">
                0.1611111
                </td>
                <td style="text-align:right;">
                0.062
                </td>
                <td style="text-align:right;">
                0.069
                </td>
                <td style="text-align:right;">
                0.055
                </td>
                <td style="text-align:right;">
                0.021
                </td>
                <td style="text-align:right;">
                0.593
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.000
                </td>
                <td style="text-align:right;">
                0.200
                </td>
                </tr>
                <tr>
                <td style="text-align:left;">

                2.  Personality Disorder
                    </td>
                    <td style="text-align:right;">
                    2.5
                    </td>
                    <td style="text-align:right;">
                    0.0055556
                    </td>
                    <td style="text-align:right;">
                    1.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    <td style="text-align:right;">
                    0.000
                    </td>
                    </tr>
                    <tr>
                    <td style="text-align:left;">

                    3.  Schizophrenia
                        </td>
                        <td style="text-align:right;">
                        7.5
                        </td>
                        <td style="text-align:right;">
                        0.0166667
                        </td>
                        <td style="text-align:right;">
                        0.200
                        </td>
                        <td style="text-align:right;">
                        0.200
                        </td>
                        <td style="text-align:right;">
                        0.600
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        <td style="text-align:right;">
                        0.000
                        </td>
                        </tr>
                        <tr>
                        <td style="text-align:left;">

                        4.  Neurosis
                            </td>
                            <td style="text-align:right;">
                            30.0
                            </td>
                            <td style="text-align:right;">
                            0.0666667
                            </td>
                            <td style="text-align:right;">
                            0.150
                            </td>
                            <td style="text-align:right;">
                            0.233
                            </td>
                            <td style="text-align:right;">
                            0.050
                            </td>
                            <td style="text-align:right;">
                            0.567
                            </td>
                            <td style="text-align:right;">
                            0.000
                            </td>
                            <td style="text-align:right;">
                            0.000
                            </td>
                            <td style="text-align:right;">
                            0.000
                            </td>
                            <td style="text-align:right;">
                            0.000
                            </td>
                            <td style="text-align:right;">
                            0.000
                            </td>
                            </tr>
                            <tr>
                            <td style="text-align:left;">

                            5.  Other
                                </td>
                                <td style="text-align:right;">
                                35.0
                                </td>
                                <td style="text-align:right;">
                                0.0777778
                                </td>
                                <td style="text-align:right;">
                                0.129
                                </td>
                                <td style="text-align:right;">
                                0.114
                                </td>
                                <td style="text-align:right;">
                                0.214
                                </td>
                                <td style="text-align:right;">
                                0.129
                                </td>
                                <td style="text-align:right;">
                                0.414
                                </td>
                                <td style="text-align:right;">
                                0.000
                                </td>
                                <td style="text-align:right;">
                                0.000
                                </td>
                                <td style="text-align:right;">
                                0.000
                                </td>
                                <td style="text-align:right;">
                                0.000
                                </td>
                                </tr>
                                </tbody>
                                </table>

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-devet2018" class="csl-entry">

de Vet, H. C. W., M. G. Mullender, and I Eekhout. 2018. “Specific Agreement on Ordinal and Multiple Nominal Outcomes Can Be Calculated for More Than Two Raters.” *Journal of Clinical Epidemiology* 96: 47–53. <https://www.jclinepi.com/article/S0895-4356(16)30837-X/abstract>.

</div>

<div id="ref-dikmans2017" class="csl-entry">

Dikmans, R. E., L. Nene, M. B. Bouman, H. C. W. de Vet, M. Mireau, M. E. Buncamper, H. Winters, M. Ritt, and M. G. Mullender. 2017. “[The Aesthetic Items Scale: A Tool for the Evaluation of Aesthetic Outcome After Breast Reconstruction]().” *Plastic and Reconstructive Surgery. Global Open.* 5 (3): e1254.

</div>

<div id="ref-fleis1971" class="csl-entry">

Fleis, J. L. 1971. “[Measuring Nominal Scale Agreement Among Many Raters]().” *Psychologiclal Bulletin* 76 (5): 378–82.

</div>

</div>
