# Loads functions and classes from commons.ps1
Import-Module .\commons.ps1

# Creates a standard powershell array
$test = @("test","test1")

# Using the print function from commons to print an array
print($test)

# Using the len() function from commons to check the length of an array
if(len($test) -eq 2){

    # Demonstrating the use of arguments with the print() function
    print -data "test" -end " no"

    # Demonstating another syntax of how args can be used with the print() function
    print(int(10))("")(" ")
}

# Demonstrates the new list class (How to create, add data, get data)
$a = [list]::new()
$a.data = @("test", "test 1")

# Prints the data from the list class at index 1 (starts at index 0)
print $a.get(1)