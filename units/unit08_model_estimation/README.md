# Unit 8 – Model estimation

This unit introduces Stata’s core commands for estimating statistical models, focusing on linear regression with Ordinary Least Squares (OLS). It also covers model tuning, result interpretation, postestimation tools, and extensions to nonlinear and panel data models.

## 📄 Slides

Read the [slides for this unit](unit08_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/wBTNRrqwBA4/0.jpg)](https://www.youtube.com/watch?v=wBTNRrqwBA4)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<span style="display:block; margin-top:0.5em;"></span>

We will use the publicly available **hs0** data from UCLA for the following exercises. 

<h5>Exercise 1 – Ordinary Least Squares </h5>

- Load the dataset **hs0.dta**.
- `regress` *math* on *write*. Interpret the estimated coefficient.
- Add `i.gender` to the model. Interpret the estimated coefficient.
- Add `c.write#i.gender` to the model. Interpret the estimated coefficient.

<textarea id="ex1" rows="12"
  style="width:100%;
         font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, 'Liberation Mono', monospace;
         font-size: 0.95rem;
         padding: 0.6rem;
         border: 1px solid #999;
         border-radius: 6px;
         color: #000;
         background-color: #fff;
         outline: none;
         box-shadow: none;"
  placeholder="Type your solution here. To run code, copy the commands into Stata."></textarea>
  
<details>
<summary>💡 Hint</summary>

*math* is your dependent (left-hand side) variable. <br>
The qualifier `c.` tells Stata that a variable is continuous, `i.` is for categorical variables.
By combining variables with `#` you include an interaction between them into the model. <br>

</details>   

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
regress math c.write
```

The coefficient on *write* shows the expected change in *math* scores for a one-point increase in writing. E.g., a 10-point increase in *write* scores is associated with a 6.1-point increase in math scores.

```stata
regress math c.write i.gender
```

The coefficient on *gender* compares females to males at the same *write* score. A negative estimate means that, controlling for writing, females have lower average *math* scores than males.

```stata
regress math c.write i.gender c.write#i.gender
```

The interaction term indicates if the slope of *write* differs by *gender*. For women, the association between *math* and *write* scores is stronger than for men. This difference is not significant.

</details>

<h5>Exercise 2 – Predictions & residuals </h5>

- Load the dataset **hs0.dta**.
- `regress` *math* on *write* and *gender*.
- `predict` fitted values *math_hat*. 
- `predict` residuals *resid_hat*.
- Plot residuals vs. fitted values.
- Provide a **QQ-plot** for the standardized residuals *resid_hat_std*.

<textarea id="ex2" rows="8"
  style="width:100%;
         font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, 'Liberation Mono', monospace;
         font-size: 0.95rem;
         padding: 0.6rem;
         border: 1px solid #999;
         border-radius: 6px;
         color: #000;
         background-color: #fff;
         outline: none;
         box-shadow: none;"
  placeholder="Type your solution here. To run code, copy the commands into Stata."></textarea>
  
<details>
<summary>💡 Hint</summary>

You may use `predict` to calculate residuals and standardized residuals. <br>
You may also calculate residuals by hand after predicting the fitted values. <br>
Use `scatter` to plot residuals (y-axis) against fitted values (x-axis). <br>
Use `qnorm resid_hat_std` for the QQ-plot.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
regress math c.write i.gender
predict math_hat
predict resid_hat, residuals
scatter resid_hat math_hat, yline(0, lcol(red))
predict resid_hat_std, rstandard
qnorm resid_hat_std
```

</details>

<h5>Exercise 3 – Testing hypotheses </h5>

- Load the dataset **hs0.dta**.
- `regress` *math* on *write* and *gender*.
- `test` if the coefficient on *write* is equal to 1.
- `test` if *write* and *gender* are jointly significant.

<textarea id="ex3" rows="6"
  style="width:100%;
         font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, 'Liberation Mono', monospace;
         font-size: 0.95rem;
         padding: 0.6rem;
         border: 1px solid #999;
         border-radius: 6px;
         color: #000;
         background-color: #fff;
         outline: none;
         box-shadow: none;"
  placeholder="Type your solution here. To run code, copy the commands into Stata."></textarea>
  
<details>
<summary>💡 Hint</summary>

Consult the *help* file for `test`. You have to pass the coefficient names to `test`. You can find the names of coefficients in the regression output.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
regress math c.write i.gender, coeflegend
test write = 1
test write 2.gender
```

</details>

<h5>Exercise 4 – Using `margins` </h5>

- Load the dataset **hs0.dta**.
- `regress` *math* on *write* and *gender*.
- Use `margins i.gender` to compare predicted *math* scores across *gender*.
- Use `predict` to calculate fitted values. `summarize` fitted values `by` *gender*. Compare your results.
- Use `margins, dydx(write)` to interpret marginal effects.


<textarea id="ex4" rows="10"
  style="width:100%;
         font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, 'Liberation Mono', monospace;
         font-size: 0.95rem;
         padding: 0.6rem;
         border: 1px solid #999;
         border-radius: 6px;
         color: #000;
         background-color: #fff;
         outline: none;
         box-shadow: none;"
  placeholder="Type your solution here. To run code, copy the commands into Stata."></textarea>
  
<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
regress math c.write i.gender
margins gender
predict math_hat 
bys gender: sum math_hat
```

Calculated means are different. <br>
`margins gender` reports adjusted means: it predicts *math* for each observation twice (as if male and as if female), holding each observation’s own *write* value fixed, then averages. So groups are compared with the same distribution of controls. <br>
Using `predict` and `bys gender: summarize` averages fitted values within each group’s actual covariate distribution, so differences in *write* across groups affect the means.

```stata
margins, dydx(write)
```

For linear models, this is just the estimated coefficient. This will become especially useful when estimating non-linear models, where marginal effects are not equal to coefficients.

</details>

<h5>Exercise 5 – Non-linear models </h5>

- Load the dataset **hs0.dta**.
- Create a dummy variable *high_math* which equals 1 for observations with a *math* score over 60, and 0 if *math* is 60 or lower.
- Estimate a logistic regression of *high_math* on *write* and *gender*.
- Use `margins, dydx()` to calculate average marginal effects.
- Use `margins, at(write = (40 50 60))` to predict probabilities of scoring high on *math* for different *write* scores.
- Use `marginsplot` to plot predicted probabilities across the empirical distribution of *write* scores.

<textarea id="ex5" rows="18"
  style="width:100%;
         font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, 'Liberation Mono', monospace;
         font-size: 0.95rem;
         padding: 0.6rem;
         border: 1px solid #999;
         border-radius: 6px;
         color: #000;
         background-color: #fff;
         outline: none;
         box-shadow: none;"
  placeholder="Type your solution here. To run code, copy the commands into Stata."></textarea>

<details>
<summary>💡 Hint</summary>

You need to `generate` a new variable. Use a suitable *if*-condition and do not forget to exclude missings. <br>
Use `logit` to estimate a logistic regression. <br>
To span the empirical range of *write*, store `r(min)` and `r(max)` in **locals** after `summarize` and feed these to `margins` with the option `at(write=(local_min(1)local_max))`. <br>
When calling a **local**, enclose its name in backticks and apostrophes: `local'.

</details> 
  
<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
gen high_math = 1 if math > 60 & !missing(math)
replace high_math = 0 if math <= 60
logit high_math c.write i.gender 
margins, dydx(write gender)
```

The average marginal effect for *write* gives the change in the probability of being above 60 in *math* for a one-point increase in the *write* score, keeping *gender* constant.

```stata
margins, at(write = (40 50 60))
```

The predicted probability (no marginal effects here!) of scoring high on *math* increases in the *write* score. 

```stata
summarize write
local write_min = r(min)
local write_max = r(max)
margins, at(write = (`write_min'(1)`write_max'))
marginsplot
```

</details>

<h5>Exercise 6 – Quiz </h5>

Answer the following Single-Choice questions (i.e., there is always exactly one correct answer) on **panel data models**. <br>

<span style="display:block; margin-top:0.5em;"></span>

**Q1: Which command tells Stata that the dataset is panel data, and what arguments does it require?** <br>
A) xtreg y x, fe <br>
B) xtset id time <br>
C) tsset id <br>
D) xtdata id time

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>
`xtset` needs a panel dimension, i.e., the identifier for units of observation which are sampled more than once. A time dimension is optional. <br>
`xtreg` estimates panel data models after you `xtset` your data.

</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q2: What command is correct for estimating a fixed-effects model?** <br>
A) xtreg y x, fe <br>
B) xtreg y x, re <br>
C) xtreg y x, mle <br>
D) xtreg y x, robust

<details>
<summary>✅ Solution</summary>

**Correct answer: A** <br>
The *option* `re` estimates a *random effects* model. <br>
The *option* `robust` provides robust standard errors.

</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q3: Suppose you have estimated a fixed-effects model with:** <br>

```stata
xtreg wage educ exp, fe
```

Which of the following statements is true? <br>
A) The effect of *educ* is identified only from variation **within** individuals over time.  <br>
B) The effect of *educ* is identified from both **between** and **within** variation.  <br>
C) In fixed effects models, standard errors are automatically cluster robust.  <br>
D) The model cannot identify the effect of *exp* since work experience never changes over time.

<details>
<summary>✅ Solution</summary>

**Correct answer: A** <br>
To estimate cluster robust standard errors, you need to specify the *option* `vce(cluster id)`

</details>


<span style="display:block; margin-top:4em;"></span>
