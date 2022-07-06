Class PowerSys{

    # The instance of the standard output class
    [stdout] $stdout = [stdout]::get()

    # Test implementation (NOT RECOMMENDED)
    static stdout($data){
        [stdout]::write($data)
    }

}