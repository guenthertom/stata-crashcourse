*********************************
*	M	A	S	T	E   R		*
*********************************

clear all
set more off 
capture log close

/******************************************************************************
This do-file serves as a blueprint for a master file
******************************************************************************/

/*******************************************************************************
Pathing
*******************************************************************************/	
if "`c(username)'" == ""{
global wd ""
global path ""
}

cd "$wd"

//Paths of folder structure (need to create folders accordingly)
global do ${wd}\do
global output ${wd}\output
global log ${wd}\log
global temp ${wd}\temp

//Globals for whatever
global global1 				1 	// This could be a switch
global global2				0	// or sth else


/*******************************************************************************
Steps of analysis 
Note: use * to exclude parts of the analysis. This only works if you save data
files at the end of each do-file and open them at the beginning of the next one
*******************************************************************************/

//Select for single execution
*do "${do}\01_merge.do"
*do "${do}\02_prep.do"
*do "${do}\03_restrict.do"
*do "${do}\04_analyze.do"

/*******************************************************************************
end of master file
*******************************************************************************/