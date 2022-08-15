# Quiz 1

1.  Consider influenza epidemics for two parent heterosexual families. Suppose that the probability is 17% that at least one of the parents has contracted the disease. The probability that the father has contracted influenza is 12% while the probability that both the mother and father have contracted the disease is 6%. What is the probability that the mother has contracted influenza?

(Hints look at lecture 2 around 5:30 and chapter 4 problem 4)

$P\left ( mother\, \cup \, father \right )\, = \, 0.17$, $P\left ( mother\, \cap \, father \right )\, = \, 0.06$, $P\left ( father \right )\, = \, 0.12$

$P\left ( mother\, \cup \, father \right )\, =\, P\left ( mother \right )\, +\, P\left ( father \right )\, -\, P\left ( mother\, \cap \, father \right )$

$P\left ( mother \right )\, =\, 0.17\, + \, 0.06\, -\, 0.12$

$P\left ( mother \right )\, =\, 0.11$

**Answer:** 11%

2.  A random variable, X is uniform, a box from 0 to 1 of height 1. (So that its density is $f\left ( x \right )\, = \, 1$ for $0\leq x\leq 1$). What is its 75th percentile?

(Hints, look at lecture 2 around 21:30 and Chapter 5 Problem 5. Also, look up the help function for the qunif command in R.)

```{r}
qunif(0.75)
```

    ## [1] 0.75

**Answer:** 0.75

3.  You are playing a game with a friend where you flip a coin and if it comes up heads you give her **X** dollars and if it comes up tails she gives you **Y** dollars. The probability that the coin is heads is $p\left ( some\, number\, between\, 0\, and\, 1 \right )$. What has to be true about **X** and **Y** to make so that both of your expected total earnings is 0. The game would then be called "fair".

head = 1, tail = 0

$P\left ( x \right )\, = \, p^{x}\left ( 1\, -\, p \right )^{1\, -\, x}$

$P\left ( 1 \right )\, = \, p^{1}\left ( 1\, -\, p \right )^{0}\, = \, p$

$P\left ( 0 \right )\, = \, p^{0}\left ( 1\, -\, p \right )^{1}\, = \, 1\, -\, p$

$x.p\, = \, y.\left ( 1\, -\, p \right )$

$\frac{p}{1\, -\, p}\, = \, \frac{y}{x}$

**Answer:** $\frac{p}{1-p}\, = \frac{Y}{X}$

4.  A density that looks like a normal density (but may or may not be exactly normal) is exactly symmetric about zero. (Symmetric means if you flip it around zero it looks the same.) What is its median? (Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2 Problem 7.)

**Answer:** The median must be 0.

5.  Consider the following PMF shown below in R

```{r}
x <- 1:4  
p <- x/sum(x)  
temp <- rbind(x, p)  
rownames(temp) <- c("X", "Prob")  
temp
```

    ## [,1] [,2] [,3] [,4]
    ## X 1.0 2.0 3.0 4.0
    ## Prob 0.1 0.2 0.3 0.4

What is the mean?

(Hint, watch Lecture 4 on expectations of PMFs.)

$E\left ( x \right )\, = \, \sum_{i = 1}^{n}\, x_{i}.p_{i}$

```{r}
sum(x * p)
```

    ## [1] 3

**Answer:** 3

6.  A web site (<http://www.medicine.ox.ac.uk/bandolier/band64/b64-7.html>) for home pregnancy tests cites the following: "When the subjects using the test were women who collected and tested their own samples, the overall sensitivity was 75%. Specificity was also low, in the range 52% to 75%." Assume the lower value for the specificity. Suppose a subject has a positive test and that 30% of women taking pregnancy tests are actually pregnant. What number is closest to the probability of pregnancy given the positive test?

(Hints, watch Lecture 3 at around 7 minutes for a similar example. Also, there's a lot of Bayes' rule problems and descriptions out there, for example [here's one for HIV testing](http://www.statlect.com/bayes_rule.htm). Note, discussions of Bayes' rule can get pretty heady. So if it's new to you, stick to basic treatments of the problem. Also see Chapter 3 Question 5.)

$P\left ( +\, |\, Preg \right )\, = \, 0.75$, $P\left ( -\, |\, Preg^{c} \right )\, = \, 0.52$, $P\left ( Preg \right )\, = \, 0.3$, $P\left ( Preg\, |\, + \right )\, = \, ?$

$P\left ( Preg\, |\, + \right )\, = \, \frac{P\left ( +\, |\, Preg \right )\, P\left ( Preg \right )}{P\left ( +\, |\, Preg \right )\, P\left ( Preg \right )\, +\, P\left ( +\, |\, Preg^{c} \right )\, P\left ( Preg^{c} \right )}$

$P\left ( +\, |\, Preg^{c} \right )\,= \, 1\, -\, P\left ( -\, |\, Preg^{c} \right )\, = \, 1\, -\, 0.52\, = \, 0.48$

$P\left ( Preg\, |\, + \right )\, = \, \frac{0.75\left ( 0.30 \right )}{0.75\left ( 0.30 \right )\, +\, 0.48\left ( 0.70 \right )}\, = \, 0.4$

**Answer:** 40%
