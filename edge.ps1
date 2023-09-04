Add-Type -AssemblyName System.Windows.Forms

$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Select a folder to download and execute the script."

if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $selectedFolder = $folderBrowser.SelectedPath
    Write-Host "Selected folder : $selectedFolder"
    $Url = "https://raw.githubusercontent.com/AveYo/fox/main/Edge_Removal.bat"
    $DownloadPath = Join-Path -Path $selectedFolder -ChildPath "Edge_Removal.bat"
    Invoke-WebRequest -Uri $Url -OutFile $DownloadPath
    Start-Process -FilePath $DownloadPath
} else {
    Write-Host "No folder have been selected."
}
