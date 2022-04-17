$toUninstall = @(
    @{Name='Discord'; ID='Discord.Discord'},
    @{Name='Docker Desktop'; ID='Docker.DockerDesktop'},
    @{Name='Git'; ID='Git.Git'},
    @{Name='Windows Terminal'; ID='Microsoft.WindowsTerminal'},
    @{Name='Steam'; ID='Valve.Steam'},
    @{Name='NordVPN'; ID='NordVPN.NordVPN'},
    @{Name='Go Lang'; ID='GoLang.Go'},
    @{Name='Microsoft Visual Studio Code'; ID='Microsoft.VisualStudioCode'},
    @{Name='Mozilla Firefox (x64 pt-BR)'; ID='Mozilla Firefox 99.0.1 (x64 pt-BR)'}
)

foreach ($software in $toUninstall)
{
    $name = $software.Name
    $id = $software.ID
    $response = Read-Host "Do you want to install $name ? [Y]Yes [N]No"

    if ($response -ne "Y" -and $response -ne "N") {
        Write-Output "Invalid Option. Use Y or N"
    }
    
    if($response -eq "Y"){
        Write-Output "Trying to install..."
        winget install $id
    }
}

Write-Output "Finished instalation script."

$response = Read-Host "Do you want to schedule Clear Recycle Bin ? [Y]Yes [N]No"
if ($response -ne "Y" -and $response -ne "N") {
    Write-Output "Invalid Option. Use Y or N"
}

if($response -eq "Y"){
    Write-Output "Trying to Schedule Task..."
    $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-WindowStyle Hidden Clear-RecycleBin -Force'
    $trigger = New-ScheduledTaskTrigger -Daily -At 9pm
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Clear Recycle Bin" -Description "Daily clear recycle bin"
}