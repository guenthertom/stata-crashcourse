# Unit 6 – Building your data set

This unit introduces Stata’s merging and appending functionalities, teaching you how to combine datasets using identifiers and manage related options and errors.

## 📄 Slides

Read the [slides for this unit](unit06_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/t0B39srarC4/0.jpg)](https://www.youtube.com/watch?v=t0B39srarC4)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 0 – Preparing your working environment</h5>

- Setup a working directory 
- Download the following data files into your working directory:
	- [pl.dta](pl.dta)
	- [hh.dta](hh.dta)
	- [pers.dta](pers.dta)
	- [edu_2015.dta](edu_2015.dta)
	- [edu_2016.dta](edu_2016.dta)
	- [edu_2017.dta](edu_2017.dta)
- Open a new do-file and specify your paths.

<textarea id="ex0" rows="6"
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
doedit
global wd "C:/.../Desktop/stata_crashcourse"
cd "${wd}"
```

</details>

<h5>Exercise 1 – Merging data</h5>
	
- Load the file **pl.dta** and inspect the data.
- Open the other data files. What are suitable identifiers for a merge with **pl.dta**?
- Merge the file **pers.dta** to **pl.dta**.
- Merge the file **hh.dta** to **pl.dta**.
- Append the education files. Merge the appended **edu.dta** to **pl.dta**.
- Inspect your final data set.

<textarea id="ex1" rows="20"
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

The *help* file for `merge` will soon become your best friend. <br>
You can temporarily open new data sets, run commands on them, and store them, if you use `preserve` and `restore`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
use pl.dta, clear
browse
```

You may use the Command window to open the other data files. This does not have to be part of your do-file. <br>
Make sure that **pl.dta** is loaded before starting the merges.

```stata
merge m:1 id using "pers.dta"
tab _merge
drop _merge

merge m:1 hid using "hh.dta"
tab _merge
drop _merge

preserve 
use "edu_2015.dta", clear
append using "edu_2016.dta"
append using "edu_2017.dta"
save "edu.dta", replace
restore

merge 1:1 id year using "edu.dta", keep(master match)
tab _merge
drop _merge
```

</details>


<h5>Exercise 2 – Quiz</h5>

Answer the following Single-Choice (i.e., there is always exactly one correct answer) questions on the different *options* for `merge`. <br>

<span style="display:block; margin-top:0.5em;"></span>

**Q1: Which option keeps only specific variables from the using file?** <br>
A) keep() <br>
B) keepusing() <br>
C) generate() <br>
D) nogen

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>

</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q2: You want to keep only matched observations from a merge. Which is correct?** <br>
A) keep(2) <br>
B) keep(match) <br>
C) keep(master) <br>
D) keep(master match)

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>
The number 2 refers to the using data (1 = master, 3 = match).

</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q3: You plan multiple merges and don’t want `_merge` to be created. Which is correct?** <br>
A) keep() <br>
B) keepusing() <br>
C) nolabel <br>
D) nogen

<details>
<summary>✅ Solution</summary>

**Correct answer: D** <br>

</details>

<span style="display:block; margin-top:4em;"></span>

