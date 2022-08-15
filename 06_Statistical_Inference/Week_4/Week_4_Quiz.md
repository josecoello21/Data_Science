# Quiz 4

1.  A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)

| Subject | Baseline | Week 2 |
|---------|----------|--------|
| 1       | 140      | 132    |
| 2       | 138      | 135    |
| 3       | 150      | 151    |
| 4       | 148      | 146    |
| 5       | 135      | 130    |

Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test.

(Hint, consider that the observations are paired.)

```{r}
bl <- c(140, 138, 150, 148, 135)
fu <- c(132, 135, 151, 146, 130)
t.test(fu, bl, alternative = "two.sided", paired = TRUE)
```

    ## Paired t-test
    ## data: fu and bl
    ## t = -2.262, df = 4, p-value = 0.08652
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ## -7.5739 0.7739
    ## sample estimates:
    ## mean of the differences
    ## -3.4

**Answer:** 0.087

2.  A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of $\mu_0$ that a test of $H_0$: $\mu$ = $\mu_0$ would fail to reject the null hypothesis in a two sided 5% Students t-test?

```{r}
1100 + c(-1, 1) * qt(0.975, 8) * 30/sqrt(9)
```

    ## [1] 1077 1123

**Answer:** 1077 to 1123

3.  Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

```{r}
pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE)
```

    ## [1] 0.3125

**Answer:** 0.31

4.  Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?

```{r}
ppois(10, lambda = 0.01 * 1787)
```

    ## ## [1] 0.03237

**Answer:** 0.03

5.  Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects' body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, give a pvalue for a two sided t test.

```{r}
n1 <- n2 <- 9
x1 <- -3 ##treated
x2 <- 1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
ts <- (x1 - x2)/(s * sqrt(1/n1 + 1/n2))
2 * pt(ts, n1 + n2 - 2)
```

    ## [1] 0.0001025

**Answer:** Less than 0.01

6.  Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of $H_{0}:\, \mu \, = \, 1,078$

**Answer:** No you wouldn't reject.

7.  Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of 0.01 $mm^{3}$. Assume that the standard deviation of four year volume loss in this population is 0.04 $mm^{3}$. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?

```{r}
pnorm(1.645 * 0.004, mean = 0.01, sd = 0.004, lower.tail = FALSE)
```

    ## [1] 0.8037

**Answer:** 0.80

8.  Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of 0.01 $mm^{3}$. Assume that the standard deviation of four year volume loss in this population is 0.04 $mm^{3}$. About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?

```{r}
ceiling((4 * (qnorm(0.95) - qnorm(0.1)))^2)
```

    ## [1] 138

**Answer:** 140

9.  As you increase the type one error rate, $\alpha$, what happens to power?

**Answer:** You will get larger power.
