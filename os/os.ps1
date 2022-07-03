Class os{

    # Creates a list of all the files in the cwd
    static [list] listdir(){
        $list = [list]::new()
        $dir = Get-Location
        foreach($item in Get-ChildItem($dir)){
            $list.add($item)
        }

        return $list
    }

    # Creates a list of all the files and folders in the specified dir
    static [list] listdir($dir){
        $list = [list]::new()

        foreach($item in Get-ChildItem($dir)){
            $list.add($item)
        }

        return $list
    }


}