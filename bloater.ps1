$toUninstall = @(
    @{Name='Discord'; ID='Discord.Discord'},
    @{Name='Docker Desktop'; ID='Docker.DockerDesktop'},
    @{Name='Git'; ID='Git.Git'},
    @{Name='Windows Terminal'; ID='Microsoft.WindowsTerminal'},
    @{Name='Steam'; ID='Valve.Steam'},
    @{Name='NordVPN'; ID='NordVPN.NordVPN'},
    @{Name='Go Lang'; ID='GoLang.Go'}
    @{Name='Microsoft Visual Studio Code'; ID='Microsoft.VisualStudioCode'}
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

Write-Output "Finished."