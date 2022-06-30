$numbers = "^\d+$"

# This function is used to print out any data to the console/terminal
function print($data, $end="", $sep=", ")
{
    # Assigns the result value
    $result = $data

    # Checks if the data given is an array, if so prints in perferred array format
    if($data -is [array])
    {
        $tempResult = "["
        foreach($entry in $data){
            $tempResult += [string]$entry + $sep
        }
        $result = $tempResult.Substring(0,$tempResult.length -2) + "]"
    }

    # Writes the output to the console/log/thing that is listening
    Write-Output "$result$end" 
}

# This allows for the length of a given variable to be found in a pythonic way
function len($data)
{
    if($data -is [string]){
        return $data.length
    }

    elseif($data -is [array]){
        return $data.length
    }else{
        return $data.length
    }
}

# This will allow for the int version of a string to be returned
function int($data)
{
    if([string]$data -match $numbers)
    {
        return [int] $data
    }
}

# This is a wrapper class around the native array class providing additional functionality
Class list{

    [array] $data = @()

    # Adds an object to the list
     add($object){
        if($this.data -ne @()){
            $placeholder = $this.data
            $placeholder.Add($object)
            $this.data = $placeholder
        }else{
            $this.data = @($object)
        }
    }

    # Gets an object at the given index
    [string] get($index)
    {
        if($index -lt (len($this.data))){
            return [string] $this.data[$index]
        }
        return [string] "null"
    }

    # Checks if the object is in the list
    [bool] contains($object){
        foreach($entry in $this.data){
            if($entry -eq $object){
                return $true
            }
        }
        return $false
    }
}

# Allows for easier implementation of web requests using defined objects
Class request
{
    static [string] get($url){
        $wc = New-Object System.Net.WebClient
        $result = $wc.DownloadString($url)
        return $result
    }

    static [string] get($url="", $params=""){
        $wc = New-Object System.Net.WebClient
        $result = $wc.DownloadString("$($url)$($params)")
        return $result
    }
}