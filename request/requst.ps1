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