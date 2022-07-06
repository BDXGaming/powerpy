Class file{

    # The name of the file and the file location
    [string] $filename = ""
    [string] $file_location = ""

    # Writes the to the file (Does not overwrite existing data)
    write($data){
        if($this.file_location -eq ""){
            $this.file_location = Get-Location
        }
        Add-Content -Path "$($this.file_location)\$($this.filename)" -Value $data
    }

    # Overwrites the existing file data
    overwrite($data){
        if($this.file_location -eq ""){
            $this.file_location = Get-Location
        }
        Set-Content -Path "$($this.file_location)\$($this.filename)" -Value $data
    }

    # Reads the file as a string
    [string] read(){
        $file_data = Get-Content "$($this.file_location)\$($this.filename)"

        return $file_data
    }
}