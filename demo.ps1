# Loads functions and classes from commons.ps1
. .\powerpy.ps1

# # Creates a standard powershell array
$test = @("In an array","test1")

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

# Creating a list from an array
$list = list($test)
$list.add("Third object")

# Remove an object at a given index
$list.remove(1)

# Demonstrate the request class
$req = [request]::get("https://google.com")

# Create a new dict object and set values
$dict = [dict]::new()
$dict.set("test", "testing")
$dict.set("index", "10")

# Remove an item via key from a dict
$dict.remove("index")

# Rremove a pair from a dict and return the value 
$key = $dict.pop("test")

# Create a new instance of the PowerSys class
$sys = [PowerSys]::new()

# Write to the stdout (by default the terminal/console)
$sys.stdout.write('This will show in the console')

# Create a new file
$file = [file]::new()

# Set the name of the file
$file.filename = "test.txt"

# Set the stdout to be the file
$sys.stdout.set($file)

# Write to the stdout (now a file)
$sys.stdout.write('This will appear in a file')

# Gets the cwd
$location = Get-Location

# Prints the name of all files and folders within the cwd
print([os]::listdir($location))