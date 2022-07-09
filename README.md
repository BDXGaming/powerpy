# PowerPy
Adding Pythonic classes and functions to PowerShell scripting!

## Structure
All core classes and functions are in the commons.ps1 file while all additional classes and functions are in their own files. For instance, request.ps1 contains 
the request class. As this is not a core feature it is not in the commons file. However, all files are loaded into the commons file so they can be used.

## How to use
At the top of your powershell file put the following, replacing powerpy_file_dir with the directory where powerpy.ps1 is located.
```powershell
. powerpy_file_dir\commons.ps1
```

## Goal
The goal of this project is to provide some wrappers around common powershell features to more resemble those found in python. Mainly this includes adding functions and classes which may be useful while writing powershell.

## Important
I work on this project when I have time, so updates may not be frequent, however if you have a suggestion please feel free to let me know or to submit a pr!
