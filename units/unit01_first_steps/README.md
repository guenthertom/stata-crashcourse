# Unit 1 – First steps in Stata

This unit introduces the Stata interface and demonstrates how to run your very first commands. You'll see how Stata combines the flexibility of spreadsheet tools with the power of syntax-based workflows.

## 📄 Slides

Read the [slides for this unit](unit01_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/N7X-ot2JS8U/0.jpg)](https://youtu.be/N7X-ot2JS8U)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 1 – Opening and exploring data</h5>

- Load the built-in dataset *auto.dta*.  
- Inspect the first 10 rows.  
- `list` three variables you observe in the dataset.

<textarea id="ex1-1" rows="4"
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

Use the command `webuse` to load the data. 

</details>

<details>
<summary>✅ Solution</summary>

```stata
webuse auto, clear
list in 1/10
list make price mpg
 ```
</details>

<h5>Exercise 2 – Understanding how Stata stores the data</h5>

- `Summarize` the variable *price*. `Sort` the data by *weight*. `Summarize` *price* again. What do you observe?

<textarea id="ex2-1" rows="6"
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

Check out the *help* file for `summarize`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
summarize price
sort weight
summarize price
 ```
 The output is the same. `Summarize` uses all non-missing information on *price*. Sorting does not matter.

</details>

<span style="display:block; margin-top:0.5em;"></span>

- `Display` the variable *price*. `Sort` the data by *weight*. `Display` *price* again. What do you observe?

<textarea id="ex2-2" rows="6"
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

You may abbreviate the command `display` with `di`.

</details>

<details>

<summary>✅ Solution</summary>

```stata
display price
sort weight
display price
 ```
 
The output is different. `Display` only shows the content of *price* for the first observation. 
As Stata stores data in an ordered table, sorting becomes relevant here.

</details>

<h5>Exercise 3 – Navigating Stata's interface</h5>

- Select the variables *mpg* and *make* in the **Variables** window. Use the **Properties** window to compare their storage types. 

<textarea id="ex3-1" rows="3"
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

You can select any variable in the **Variables** window by clicking on its name.

</details>

<details>
<summary>✅ Solution</summary>

*mpg* is stored as an integer. <br>
*make* is stored as a string.

</details>

<span style="display:block; margin-top:0.5em;"></span>

- `Summarize` the variable *foreign*. What type of variable is it?
- Repeat the command for the variable *headroom* by using the **History** window. 

<textarea id="ex3-2" rows="4"
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

You can repeat any command from the **History** window by clicking on it. You will have to change the variable passed to the command though.

</details>

<details>

<summary>✅ Solution</summary>

```stata
summarize foreign
summarize headroom
 ```
 
*foreign* is a dummy variable with value labels.

</details>

<span style="display:block; margin-top:4em;"></span>
