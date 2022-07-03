# Allows for easier implementation of web requests using defined objects
Class request
{
    
    # Makes a get request to the given URL, downloads the result as a string
    static [string] get($url){
        $wc = New-Object System.Net.WebClient
        $result = $wc.DownloadString($url)
        return $result
    }

    # Makes a get request to the given URL with the params provided
    static [string] get($url="", $params=""){
        $wc = New-Object System.Net.WebClient
        $result = $wc.DownloadString("$($url)$($params)")
        return $result
    }
}