param (
    [Parameter(Mandatory = $false)]
    [string]$FolderPath = (Get-Location).Path
)

# Check if the folder exists
if (-Not (Test-Path -Path $FolderPath)) {
    Write-Output "The folder '$FolderPath' does not exist."
    exit 1
}

# Take ownership of the folder
try {
    Write-Output "Taking ownership of the folder: $FolderPath"
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c takeown /f `"$FolderPath`" /r /d Y" -Wait -NoNewWindow

    # Grant Full Control to the current user
    Write-Output "Granting Full Control to the current user: $currentUser"
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c icacls `"$FolderPath`" /grant `"$currentUser`":(F) /t /c" -Wait -NoNewWindow

    # Delete the folder
    Write-Output "Deleting the folder: $FolderPath"
    Remove-Item -Path $FolderPath -Recurse -Force
    Write-Output "Folder deleted successfully."
} catch {
    Write-Output "An error occurred: $_"
}
