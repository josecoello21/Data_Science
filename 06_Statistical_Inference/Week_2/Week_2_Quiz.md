# Quiz 2

1.  What is the variance of the distribution of the average an IID draw of *n* observations from a population with mean $\mu$ and variance $\sigma ^{2}$

**Answer:** $\frac{\sigma ^{2}}{n}$

2.  Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?

```{r}
pnorm(70, mean = 80, sd = 10)
```

    ## [1] 0.1587

**Answer:** 16%

3.  Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?

```{r}
qnorm(p = .95, mean = 1100, sd = 75)
```

    ## 1223.364

**Answer:** approximately 1223

4.  Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?

```{r}
qnorm(0.95, mean = 1100, sd = 75/sqrt(100))
```

    ## [1] 1112.336

**Answer:** approximately 1112 cc

5.  You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?

```{r}
sum(dbinom(x = 4:5, size = 5, prob = .5))
```

    ## [1] 0.1875

**Answer:** 19%

6.  The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?

```{r}
pnorm(16, mean = 15, sd = 10/sqrt(100)) - pnorm(14, mean = 15, sd = 10/sqrt(100))
```

    ## [1] 0.6826895

**Answer:** 68%

7.  Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?

**Answer:** 0.5

8.  The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people?

```{r}
ppois(10, lambda = 15)
```

    ## [1] 0.1184644

**Answer:** 0.12
