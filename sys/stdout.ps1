Class stdout{

    [object] $output = "console"
    [file] $file 
    static [stdout] $stdout = $null

    static [stdout] get(){
        if([stdout]::stdout -eq $null){
            [stdout]::stdout = [stdout]::new()
        }
        return [stdout]::stdout
    }

    # Writes the data to the console/terminal
    write($data){

        $has_output = $false
        if ($this.output -eq "console"){
            Write-Host $data
            $has_output = $true
        }

        if (($this.output -eq "file" ) -and (!($has_output))){
            $this.file.write($data)
        }

    }

    # Sets the stdout which is being used
    set($output){

        if(type_of($output) -eq "file"){
            $this.output = "file"
            $this.file = $output
        }else{
            $this.output = $output
        }
    }

}