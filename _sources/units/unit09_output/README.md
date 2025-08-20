# Unit 9 – Output presentation

This unit introduces tools for exporting, formatting, and visualizing your results in Stata, including log files, publication-ready tables, and postestimation output. Special emphasis is placed on the powerful and versatile twoway command.

## 📄 Slides

Read the [slides for this unit](unit09_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/fBQJl2Ki6mc/0.jpg)](https://www.youtube.com/watch?v=fBQJl2Ki6mc)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<span style="display:block; margin-top:0.5em;"></span>

We will use **hs0** data from UCLA for the following exercises. 

<h5>Exercise 0 – Preparing your working environment</h5>

- Setup a working directory. 
- Create the following folders: log, output.
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
global log "${wd}/log"
global output "${wd}/output"
cd "${wd}"
```

</details>

<h5>Exercise 1 – Using log files </h5>

- At the top of your do-file, ensure that any open log files are closed.
- Create a new `log` file "**mylog.txt**" `using` your log folder. Save it as a `text` file. `Name` it *logout*.
- Load the **hs0** data.
- Turn the log file off using `log off logout`.
- `Regress` *math* on *write*. 
- Turn the log file on using `log on logout`.
- `Regress` *math* on *write* and *gender*.
- Close the log file at the end of your do-file. Inspect the log file in your working directory.

<textarea id="ex1" rows="10"
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

Use `capture` if you are not sure if a command will execute. E.g., if you are not sure if a log file called *logout* is currently open, you can use `capture log close logout` to try to close it. If it is not open, nothing will happen and Stata will move on. <br>
`log using` let's you specify a file name and path for log file storage. Just like when saving data, use the *option* `replace` to make sure to overwrite existing files.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
capture log close logout
log using "${log}/mylog.txt", replace text name(logout)

use "https://stats.idre.ucla.edu/stat/data/hs0", clear

log off logout

* Estmimate model 1
regress math write

log on logout

* Estmimate model 2
regress math c.write i.gender

log close
```

Your log file should only contain the output for model 2, because you explicitly turned the `log off` before model 1.

</details>

<h5>Exercise 2 – Formatting regression output </h5>

- Load the **hs0** data.
- `Regress` *math* on *write* and store the model as *m1* using `eststo`.
- `Regress` *math* on *write* and *gender*. Store the model as *m2*.
- Use `esttab m1 m2` to get a basic table of your output in Stata.
- Use `esttab` to store the table as an **.rtf** file in your output folder.

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

You can use basic `esttab` to get nicely formatted tables for your log files. <br>
`using` let's you pass a path to `esttab` to store your table.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear

eststo clear // Clears currently stored estimates
regress math c.write
eststo m1

regress math c.write i.gender
eststo m2

esttab m1 m2 
esttab m1 m2 using "${output}/regression_table.rtf", replace
```

Use the *options* to tailor the table to your specific needs. E.g., using *option* `se` prints standard errors instead of t-statistics.

</details>

<h5>Exercise 3 – Designing twoway graphs </h5>

- Load the **hs0** data.
- Make a `twoway scatter` plot of *math* (y-axis) against *write* (x-axis).
- Choose different colors for male and female observations.
- Add a line of best fit for each gender to your graph.
- Include custom titles and a legend.
- Use `graph export` to save the final graph as "**mygraph.pdf**" in your output folder.

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

You can combine `twoway`graphs by putting them in parentheses: `twoway scatter () ()`. <br>
Use suitable *if*-conditions to plot data points for one gender at a time. <br>
Use line breaks `///` or change the delimiter to handle long `twoway` commands.

</details> 

<details>
<summary>✅ Solution</summary>

```stata
use "https://stats.idre.ucla.edu/stat/data/hs0", clear

* Basic graph
twoway scatter math write

* With different colors by gender
twoway (scatter math write if gender == 1, mcolor(navy)) ///
(scatter math write if gender == 2, mcolor(maroon))

* With a line of best fit by gender
twoway (scatter math write if gender == 1, mcolor(navy)) ///
(scatter math write if gender == 2, mcolor(maroon)) ///
(lfit math write if gender == 1, lcol(navy)) ///
(lfit math write if gender == 2, lcol(maroon))

* With complete formatting
twoway (scatter math write if gender == 1, mcolor(navy)) ///
(scatter math write if gender == 2, mcolor(maroon)) ///
(lfit math write if gender == 1, lcolor(navy)) ///
(lfit math write if gender == 2, lcolor(maroon)), ///
legend(order(1 "Male" 2 "Female") col(2) pos(6)) ///
ytitle("Math") xtitle("Writing") title(""OLS fit of math on writing, by gender"")

* Export final graph
graph export "${output}/mygraph.pdf", replace
```

</details>

<span style="display:block; margin-top:4em;"></span>
