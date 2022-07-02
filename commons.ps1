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

# Converts a native array into a list 
function list($array){
    $list = [list]::new()
    $list.data = $array
    return $list
}

# This is a wrapper class around the native array class providing additional functionality
Class list{

    [array] $data = @()

    # Adds an object to the list
     add($object){
        if($this.data -ne @()){
            $this.data += $object
        }else{
            $this.data = @($object)
        }
    }

    # Removes either the object at the given index OR the object in the list with that value
    remove($index){
        $newList = @()

        if($this.contains($index)){
            foreach($entry in $this.data){
                if($entry -ne $index){
                    $newList += $entry
                }
            }
        }else{
            $indexPos = 0
            foreach($entry in $this.data){
                if ($indexPos -ne $index){
                    $newList += $entry
                }
                $indexPos += 1
            }
        }

        $this.data = $newList
    }

    remove_index($index){
        $newList = @()
        $indexPos = 0
        foreach($entry in $this.data){
            if ($indexPos -ne $index){
                $newList += $entry
            }
            $indexPos += 1
        }
        $this.data = $newList
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

    # Gets the index of an object if in the list
    [int] index($object){
        $index = 0
        foreach($entry in $this.data){

            if($entry -eq $object){
                return $index
            }

            $index += 1
        }

        return -1
    }

    [string] ToString(){
        $string = "["
        $isFirst = $true
        foreach ($entry in $this.data){
            if (!($isFirst)){
                $string += ", "
            }
            $isFirst = $false
            $string += "$($entry)"
        }
        $string += "]"
        return $string
    }
}

Class dict{

    # Creates the key and value lists for the dict class
    [list] $keys = [list]::new()
    [list] $values = [list]::new()

    # Sets the key-value pair
    set($key, $value){

        # Checks if a value with the given key already exists
        if(!($this.keys.contains($key))){
            $this.keys.add($key)
            $this.values.add($value)

        # If exists removes and replaces existing pair with provided pair
        }else{
            $index = $this.keys.index($key)
            $this.keys.remove($key)
            $this.values.remove($index)

            $this.keys.add($key)
            $this.values.add($value)
        }
    }

    # Gets the value for a given key
    [object] get($key){
        if ($this.keys.contains($key)){
            $index = $this.keys.index($key)
            return $this.values.get($index)
        }
        return $null
    }

    # Removes the key-value pair for the given key if exists
    remove($key){
        if($this.keys.contains($key)){
            $index = $this.keys.index($key)
            $this.keys.remove($key)
            $this.values.remove_index($index)
        }
    }

    # Removes the key-value pair from the dict and returns the value for the given key if exists
    [object] pop($key){
        if($this.keys.contains($key)){
            $value = $this.values.get($this.keys.index($key))
            $this.remove($key)
            return $value
        }
        return $null
    }

    # Converts the dict into a string
    [string] ToString(){
        $string = "{"
        $isFirst = $true
        foreach($key in $this.keys.data){

            if(!($isFirst)){
                $string += ", "
            }
            $isFirst = $false
            $index = $this.keys.index($key)
            $keyStr = $this.keys.get($index)
            $value = $this.values.get($index)
            $string += "$($keyStr):$($value)"
        }
        $string += "}"
        return $string
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