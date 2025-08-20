# Unit 5 – Data inspection

This unit introduces core tools for inspecting and understanding your data in Stata. You learn how to explore variable properties, tabulate and visualize distributions, and manage temporary storage with macros and scalars.

## 📄 Slides

Read the [slides for this unit](unit05_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/IInvcj0lZXw/0.jpg)](https://www.youtube.com/watch?v=IInvcj0lZXw)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 1 – Quiz</h5>

Answer the following Single-Choice (i.e., there is always exactly one correct answer) questions. <br>

<span style="display:block; margin-top:0.5em;"></span>

**Q1: Which of the following statements is correct?** <br>
A) Adding two strings will result in their numeric sum. <br>
B) Integers and floats are both numeric, but only integers can have decimals. <br>
C) Integers can be converted into strings. <br>
D) Value labels change the underlying numeric values.

<details>
<summary>✅ Solution</summary>

**Correct answer: C** <br>
Adding two strings will paste them together: "Hello" + "World" = "HelloWorld" <br>
Integers do not have decimals, floats may have decimals. <br>
Value labels are so-called meta data that assign *additional* information to underlying numeric values.
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q2: Which of the following is a valid *if* condition?** <br>
A) summarize price if mpg = 20 <br>
B) summarize price if mpg == 20 <br>
C) summarize price if mpg == 20 | 30 <br>
D) summarize price if mpg !20

<details>
<summary>💡 Hint</summary>

See slide 9: if only… for details on logical operators.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: B** <br>
In Stata, `=` is an assignment operator. To test for equality you have to use `==`. <br>
When you want to combine two *if*-conditions with the operator OR `|`, you have to re-specify the variable again or use `inlist`. <br>
The negation of the equality operator is `!=`.
</details>

<span style="display:block; margin-top:0.5em;"></span>

**Q3: Assume you have ten data points (1, 2, ..., 10). What does the command `list in 3/-3` return?** <br>
A) 3, 4, 5, 6, 7, 8 <br>
B) 3, 2, 1, 0 <br>
C) 3, 4, 5, 6, 7 <br>
D) 3, 6, 9

<details>
<summary>💡 Hint</summary>

You only have this one variable in the data set. <br> 
A negative number in the command means you are counting backwards, starting at the very last observation. <br>
In Stata, the first entry of an ordered list gets the index 1.

</details>

<details>
<summary>✅ Solution</summary>

**Correct answer: A** <br>
0 is not part of the data.
The -3 means that we count backwards, starting with 10 as the first observation. Thus, 8 is the third observation from the end of the list.
</details>

<h5>Exercise 2 – Generating and inspecting value labels</h5>

- Load the built-in *auto.dta*.
- `Browse` the data and look for a String variable.
- `Encode` this variable. What do you observe?
- Use `codebook` to inspect the variable *foreign*. What are its value and attached value labels?
- `Recode` *foreign* so that the value 1 now equals 2. What happens to the values and value labels?
- Use `label dir` and `label list` to inspect all value labels of the data.

<textarea id="ex2-1" rows="20"
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

When `browsing` the data, value labels will be highlighted in blue. <br>
Some commands like `encode` have mandatory *options* that you have to specify. These are not in `[]` in the *help* file.

</details>


<details>
<summary>✅ Solution</summary>

```stata
webuse auto, clear
browse
encode make, gen(make_num)
tab make_num
tab make_num, nolab
 ```

Encode sorts the string variable alphabetically and then assigns consecutive integers (here: 1-74) as categories. 
 
```stata
codebook foreign
 ``` 
 
The variable has two unique values (0/1) with the labels "Domestic" (0) and "Foreign" (1). 

```stata
recode foreign (1=2)
codebook foreign
 ``` 
 
The variable still has two unique values (0/2), but there is no label attached to the number 2. Value labels do not change according to changes in the values themselves.
 
```stata
label dir
lab list 
 ```  

There are two value labels in the data named "make_num" (self-generated) and "origins". `Label list` provides the content of all value labels in the data.
 
</details>

<h5>Exercise 3 – Complex if-conditions </h5>

- Load the original *auto.dta*.
- Show frequencies of all car types stored in the variable `make`.
- Use an *if*-condition to show which car types weigh more than 4000 lbs.
- Use an *if*-condition to show which car types weigh less than 2000 lbs or more than 4000 lbs and cost more than 8000.

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

You can use the command `tabulate` to show frequencies. <br>
You can combine *if*-conditions with logical operators. When combining AND `&` with OR `|` conditions, Stata will evaluate AND `&` conditions first. You can override this behavior by putting OR `|` conditions in paratheses `()`.

</details>

<details>
<summary>✅ Solution</summary>

```stata
webuse auto, clear
tab make
tab make if weight > 4000
tab make if (weight < 2000 | weight > 4000) & price > 8000
 ```

</details>

<span style="display:block; margin-top:4em;"></span>
