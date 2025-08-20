# Unit 2 – Stata commands

This unit introduces the foundational structure of Stata commands and guides you through the use of Stata's built-in help system. 

*Screenshots from Stata's help files are used with permission from StataCorp and are included here for educational purposes only.*

## 📄 Slides

Read the [slides for this unit](unit02_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/7z9fCGeyWZI/0.jpg)](https://www.youtube.com/watch?v=7z9fCGeyWZI)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 1 – Quiz</h5>

Answer the following Single-Choice (i.e., there is always exactly one correct answer) questions with help of the *auto.dta*. <br>

<span style="display:block; margin-top:0.5em;"></span>

**Q1: Which of the following is correct syntax for a `summarize` command?** <br>
A) summarize varlist if foreign == 0 <br>
B) summarize foreign, tab <br>
C) summarize weight price, by(foreign) <br>
D) summarize headroom if in make

<details>
<summary>💡 Hint</summary>

To consult the help file for summarize, type: `help summarize`

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: C** <br>
In A, we pass a variable called *varlist* to summarize. This variable does not exist in the data. <br>
In B, we specify an option that is not allowed for summarize. <br>
In D, we do not specify an if-condition and *make* does not specify observation numbers. <br>
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q2: According to the help file, which of the following is the minimal abbreviation for `summarize`?** <br>
A) s <br>
B) su <br>
C) sum <br>
D) summar

<details>
<summary>💡 Hint</summary>

You can identify the minimal abbreviation by the underlined part of the command.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q3: Which of the following becomes available as output when specifying the option `detail` for summarize?**<br>
A) Means for all subgroups of the data <br>
B) All value labels <br>
C) Correlations with other variables <br>
D) Specific percentiles 

<details>
<summary>💡 Hint</summary>

Scroll down the help file until you find the `Stored results`.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: D** <br>
To calculate means for subgroups, you could use `by` as a prefix or option. <br>
To get value labels, you could use the command `codebook`. <br>
To calculate correlations, you could use the command `correlate`.
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q4: Which of the following can you use to limit a command to specific *rows* of the data**<br>
A) varlist <br>
B) if <br>
C) weight <br>
D) using 

<details>
<summary>💡 Hint</summary>

You may find a suitable `Example` in the help file of the command `generate`.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>
*if* needs a condition to select observations (rows) of your data.
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q5: Which of the following can you use to limit a command to specific *columns* of the data**<br>
A) varlist <br>
B) if <br>
C) weight <br>
D) using 

<details>
<summary>💡 Hint</summary>

Try it out with `summarize`.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: A** <br>
By passing selected variables to a command, the command will only execute for these variables (columns).
</details>

<h5>Exercise 2 – Exploring a new command</h5>

- Use the command `tabulate` to get the share of *foreign* cars in the data.
- Use the same command to analyze if *foreign* or *domestic* cars needed more repairs in 1978.
- Create seperate dummy variables (0/1) for each repair record in the data.

<textarea id="ex2-1" rows="5"
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

Carefully study the *help* file of `tabulate`. The command may behave differently depending on the number of variables passed to it.

</details>

<details>

<summary>✅ Solution</summary>

```stata
tab foreign
tab rep78 foreign
tab rep78, gen(rep_dummy)
 ```
Using the option `generate` creates five dummy variables *rep_dummy1*-*rep_dummy5*.
</details>

<span style="display:block; margin-top:4em;"></span>

