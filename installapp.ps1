New-Item -ItemType Directory -Path 'C:\files'
$folder = "c:\files"
$url= "https://esta1esvdcartifacts01.blob.core.windows.net/scripts/shir/VC_redist.x64.exe?sp=rcw&st=2020-01-20T21:12:39Z&se=2020-01-22T05:12:39Z&spr=https&sv=2019-02-02&sr=b&sig=FRuuyrReHRNE6uykmcw%2BR8fEhax08m%2BQZGA1vCTqmbA%3D"
$req = [System.Net.HttpWebRequest]::Create($url)
$req.Method = "HEAD"
$response = $req.GetResponse()
$fUri = $response.ResponseUri
$filename = [System.IO.Path]::GetFileName($fUri.LocalPath); 
$response.Close()
$target = join-path $folder $filename 
Invoke-WebRequest -Uri $url -OutFile $target 

$file = "c:\files\VC_redist.x64.exe"

(Start-Process -FilePath $file -ArgumentList "/install /quiet /norestart" -Wait -PassThru).ExitCode
