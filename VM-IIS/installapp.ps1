New-Item -ItemType Directory -Path 'C:\files'
$folder = "c:\files"
$url= "https://cs4945cfaa111b8x4f18x8bb.blob.core.windows.net/scripts/VC_redist.x64.exe"
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