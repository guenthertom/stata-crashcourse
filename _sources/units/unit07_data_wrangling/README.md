# Unit 7 – Data wrangling

This unit introduces how to create, modify, label, and manage variables in Stata, including best practices for handling missing values and working with panel data.

## 📄 Slides

Read the [slides for this unit](unit07_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/SkVOn-abKwQ/0.jpg)](https://www.youtube.com/watch?v=SkVOn-abKwQ)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<span style="display:block; margin-top:0.5em;"></span>

We will use **hs0** data from UCLA for the following exercises. 

<h5>Exercise 1 – Transforming variables </h5>

- Load the **hs0** data.
- Calculate the total score over the variables *read*, *write*, *math*, *science*, and *socst*.
- Calculate the mean score over the five variables using `generate`.
- Calculate the mean score over the five variables using `egen`. Compare your results.
- z-standardize the *math* scores.

<textarea id="ex1" rows="14"
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

You can load the data with `use "https://stats.idre.ucla.edu/stat/data/hs0", clear`. <br>
You can calculate the mean by dividing the total score by the number of categories. <br>
There is an `egen` function for z-standardization. 

</details>

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
gen total_score = read + write + math + science + socst
gen mean_score = total_score / 5
egen mean_score_comp = rowmean(read write math science socst)
br if mean_score != mean_score_comp
```

The mean calculation by hand excludes all observations that have missing information on any score variables. <br>
`egen rowmean()` ignores missing values.

```stata
egen math_z = std(math)
hist math_z, norm
```

</details>

<h5>Exercise 2 – Working with missing observations </h5>

- Load the **hs0** data.
- Check how many missings there are on the variables *read*, *math* and *science*.
- Summarize *math* scores for students with a *science* score below 60 and for students with a score above 60.
- Impute missing *science* scores by the overall mean of *science*. Generate a new variable for the imputed version and flag imputed observations.

<textarea id="ex2" rows="20"
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

You can use `codebook` or `tab [varname], miss` to inspect missing values. <br>
Remember that Stata treats missings as greater than any number. <br>
For the imputation, you could use a combination of `egen()` and `replace`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
codebook read math science
```

There are 5 missing science scores. The other two variables are complete.

```stata
sum math if science < 60
sum math if science > 60 & !missing(science)
```

Because missing is treated as greater than any number in Stata, use `!missing(var)` when you filter with `>` or `>=`.

```stata
clonevar science_imp = science // Generate version for imputation
gen miss_flag = 1 if missing(science) // Flag missing observations
egen science_mean = mean(science)
replace science_imp = science_mean if miss_flag == 1
sum science science_imp
```

Since we impute missing values with the overall mean, the mean of the imputed variable will be the same.

</details>


<h5>Exercise 3 – Working `by` subgroups </h5>

- Load the **hs0** data.
- Inspect and `encode` the variable *prgtype*.
- Calculate mean *math* scores `by` program type. Which type performs best?
- Plot histograms of *math* scores `by` *gender*

<textarea id="ex3" rows="8"
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

You do not have to create new variables for the mean scores. `Summarize` works with `by` if the data is sorted. Use `bysort` for that. <br>
You can plot two seperate histograms or combine them in one graph. If *histogram* does not support `by`, you have to work with *if*-conditions.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
codebook prgtype
encode prgtype, gen(prgtype_num)
codebook prgtype_num
bysort prgtype_num: sum math
```

The academic tracks have the highest average math scores.

```stata
codebook gender
hist math if gender == 1
hist math if gender == 2
// Both in one graph
hist math if gender == 1, col(red) addplot(hist math if gender == 2)
// Using twoway
twoway (hist math if gender == 1, col(red)) (hist math if gender == 2)
```

</details>

<h5>Exercise 4 – Managing the size of your data set </h5>

- Load the **hs0** data.
- Drop the variables *schtyp* and *ses*
- Keep only complete (non-missing) observations.
- Drop all observations from a *vocational* program.

<textarea id="ex4" rows="8"
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

There is an `egen` function that you can use to count missings on `_all` variables for each observation. <br>
Check the storage type of *prgtype* before dropping observations.

</details>   
  
<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear
drop schtyp ses
// Generate help variable to count the missings on all variables
egen missings = rowmiss(_all)
keep if missings == 0
codebook prgtype
drop if prgtype == "vocati"
```

You could also `encode` prgtype before dropping variables if you do not want to work with strings.

</details>  
  
  

<span style="display:block; margin-top:4em;"></span>
