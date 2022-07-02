# PowerPy
Adding Pythonic classes and functions to PowerShell scripting!

## Structure
All core classes and functions are in the commons.ps1 file while all additional classes and functions are in their own files. For instance, request.ps1 contains 
the request class. As this is not a core feature it is not in the commons file. However, all files are loaded into the commons file so they can be used. 
