clear all
set more off 
capture log close

/******************************************************************************
Insert Title here
******************************************************************************/
//Who is currently working on this do file?
global user "YOUR NAME" 

//Specify paths of researcher "YOUR NAME"
if ${user} == "YOUR NAME" {
global wd "YOUR PATH"
global data "${wd}\Data"
global do "${wd}\Do"
global output "${wd}\Output"
global log "${wd}\Log"
}

//Specify paths of researcher "OTHER NAME"
if ${user} == "OTHER NAME" {
global wd "OTHER PATH"
global data "${wd}\Data"
global do "${wd}\Do"
global output "${wd}\Output"
global log "${wd}\Log"
}

//Change working directory to project folder
cd "${wd}"

/******************************************************************************
Insert short description of project and/or do-file content here
******************************************************************************/