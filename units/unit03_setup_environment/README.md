# Unit 3 – Setting up Stata

This unit will enable you to set up and manage your working environment in Stata, introducing do-files and essential coding practices such as commenting and path management.

## 📄 Slides

Read the [slides for this unit](unit03_slides.pdf) before watching the video.

## ▶️ Video

👉 Click the image to open the video on YouTube. Right-click to open the video in a new tab.

[![Watch the video](https://img.youtube.com/vi/82-JGNVnJMU/0.jpg)](https://www.youtube.com/watch?v=82-JGNVnJMU)

## 🧪 Exercises

When you've completed the video, try to solve the following exercises. For your solutions, you may use the provided prompt or, even better, solve the tasks directly in Stata.

<h5>Exercise 1 – Writing your first do-file</h5>

- Open the do-file editor with `doedit`
- Write a simple do-file that loads the *auto.dta* and displays the **mean** of *price* and *weight*

<textarea id="ex1" rows="6"
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

Use the same commands that you would use in the Command window. You can calculate the mean of variables with `summarize`.

</details>

<details>
<summary>✅ Solution</summary>

Write in Command window: <br>
```stata
doedit
 ```
Write in do-file
```stata
webuse auto, clear 
summarize price weight
 ```

</details>

<h5>Exercise 2 – Commenting your code</h5>

- Extend your do-file by adding comments explaining each step.
- Run the commented do-file. What do you observe?

<textarea id="ex2" rows="6"
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

Use `*`, `//` or `*/ multi-line comment */` to create comments.

</details>

<details>
<summary>✅ Solution</summary>

```stata
webuse auto, clear // Load auto.dta, overwriting currently stored data

* Calculate the mean of important variables
summarize price weight 
 ```
 Comments are not shown in the output. The output looks the same as before.

</details>

<h5>Exercise 3 – Working with delimiters</h5>

Inspect the following Stata code which summarizes multiple variables from the *auto.dta*:

```stata
webuse auto, clear
summarize price ///
		  make  ///
		  weight
```

- Does the code work? Explain your answer.
- Use the delimiter `;` to alter the code snippet.

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

You can choose a delimiter with the command `#delimit`. 

</details>

<details>
<summary>✅ Solution</summary>

The code works as `///` indicates that `summarize` spans multiple lines. <br>

```stata
#delimit ;
summarize price 
	make
	weight 
	;
```

To return to the default delimiter, type `#delimit cr`

</details>

<h5>Exercise 4 – Pathing</h5>

You can use `globals` to store paths to your data, working directory, do-files, output folder, etc. <br>
By doing so, you can just call the correct global instead of repeatedly copy-pasting long directory paths.

- Create a new folder on your desktop called *stata_crashcourse*.
- In the new folder, create three subfolders: *do*, *output*, *data*.
- Open a new do-file and create a `global` *wd* which contains the path to your folder *stata_crashcourse*.
- Create two additional `globals` *do* and *output* which point to your local folders of the same name.
- Change the working directory to the folder *stata_crashcourse*.
- Issue the command `macro list` and run the do-file. What do you observe?

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

When creating a `global`, put the file name in "". You can call an existing global with `${global_name}`. <br>
You can add characters to an existing global.  

</details>

<details>
<summary>✅ Solution</summary>

```stata
doedit
global wd "C:/.../Desktop/stata_crashcourse"
global do "${wd}/do"
global output "${wd}/output"

cd "${wd}"

macro list 
 ```
The command `macro list` shows the content of all globals and locals. If done correctly, you should find your stored paths here. Depending on your platform, you could also use backslashes `\` in your paths. Forward slashes `/` work cross-platform though.

</details>

