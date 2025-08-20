# Unit 4 – Loading data into Stata

This unit teaches you how to load, import, and save data in Stata, covering native .dta files as well as external formats like .xlsx and .csv

## 📄 Slides

Read the [slides for this unit](unit04_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/eAAeOvozHrY/0.jpg)](https://www.youtube.com/watch?v=eAAeOvozHrY)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 1 – Opening and exploring data</h5>

Inspect the following Stata code which uses the built-in *auto.dta*:

```stata

// Load data and create a new variable
webuse auto
gen price_to_weight_ratio = price / weight

// Load the data again, to create a different variable
webuse auto
gen mpg_to_weight_ratio = mpg / weight

```

- Does the code execute without throwing an error? Explain your answer.

<textarea id="ex1" rows="3"
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
  placeholder="Type your solution here."></textarea>

<details>
<summary>💡 Hint</summary>

Consult the *help* file of the command `use`.

</details>

<details>
<summary>✅ Solution</summary>

The code throws an error as we do not clear the memory of Stata when loading the data again. <br>
Stata will not overwrite currently stored data by itself.

</details>

<h5>Exercise 2 – Importing Excel data</h5>

- Download our [survey.xlsx](survey.xlsx) and safe it into your working folder.
- Set the working directory to your working folder.
- Import the spreadsheet data with the command `import excel`. Try to import variable names as well.
- `Browse` the data.

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

You can set your working directory with `cd` and your directory path. <br>
Use a suitable *option* to import the variable names from the spreadsheet.

</details>

<details>
<summary>✅ Solution</summary>

```stata
global wd "C:/.../Desktop/stata_crashcourse"
cd "${wd}"
import excel using "survey.xlsx", firstrow clear
browse
```

Without the option `firstrow` variable names will be generic capital letters (A, B, C, ...).

</details>

<h5>Exercise 3 – Importing .csv data</h5>

- Download our [survey.csv](survey.csv) and safe it into your working folder.
- Set the working directory to your working folder.
- Import the data with the command `import delimited`. Try to import variable names as well.
- `Browse` the data.

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

You can set your working directory with `cd` and your directory path. <br>
You may want to open the .csv file first to check that it uses standard delimiters. <br>
You can specify the delimiter in the *options* of `import delimited`. <br>
If you use the same do-file as before, do not forget to `clear`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
global wd "C:/.../Desktop/stata_crashcourse"
cd "${wd}"
import delimited using "survey.csv", clear
browse
```

By default, `import delimited` will check the first entries of any .csv file for variable names.

</details>

<h5>Exercise 4 – Importing messy data</h5>

Not all data is nicely formatted after your import. We prepared a little toy data set to show you what you may have to deal with in the future.

- Download our [messy.xlsx](messy.xlsx) and safe it into your working folder.
- Set the working directory to your working folder.
- Import the data and inspect it. What do you observe?
- `Rename` variables if necessary.
- Try to use `destring` to fix the wrongly imported variable *score*. 

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
<summary>💡 Hint</summary>

You can set your working directory with `cd` and your directory path. <br>
If you use the same do-file as before, do not forget to `clear`. <br>
In Stata, variable names may not start with numbers. <br>
Inspect the data anytime you apply the command `destring`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
global wd "C:/.../Desktop/stata_crashcourse"
cd "${wd}"
import excel using "messy.xlsx", firstrow clear
browse
```

Stata manages to correct some non-applicable variable names by itself. It stores the original names as a *label*. We do not need to use `rename` here. All variables are imported as *strings*.

```stata
destring score, replace // does not work
destring score, gen(score_num) // does not work
destring score, gen(score_num) force // Creates many missings
destring score, gen(score_num) dpcomma  
```

We have to apply the *option* `dpcomma` to tell Stata to interpret commas as decimal points. Otherwise, `destring` will not execute or delete many of our observations. You have to be extra careful when using this command.

</details>

<span style="display:block; margin-top:4em;"></span>
