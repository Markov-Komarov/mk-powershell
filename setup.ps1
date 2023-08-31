#If the file does not exist, create it.
if (!(Test-Path -Path $PROFILE -PathType Leaf)) {
    try {
        # Detect Version of Powershell & Create Profile directories if they do not exist.
        if ($PSVersionTable.PSEdition -eq "Core" ) { 
            if (!(Test-Path -Path ($env:userprofile + "\Documents\Powershell"))) {
                New-Item -Path ($env:userprofile + "\Documents\Powershell") -ItemType "directory"
            }
        }
        elseif ($PSVersionTable.PSEdition -eq "Desktop") {
            if (!(Test-Path -Path ($env:userprofile + "\Documents\WindowsPowerShell"))) {
                New-Item -Path ($env:userprofile + "\Documents\WindowsPowerShell") -ItemType "directory"
            }
        }

        Invoke-RestMethod https://raw.githubusercontent.com/Markov-Komarov/mk-powershell/main/profile.ps1 -o $PROFILE
        Write-Host "The profile @ [$PROFILE] has been created."
		
		Invoke-WebRequest https://raw.githubusercontent.com/Markov-Komarov/mk-powershell/main/starship.toml -o "$HOME\Documents\PowerShell\starship.toml"
		Write-Host "The starship config @ [$env:userprofile + "\Documents\Powershell"] has been created."
    }
    catch {
        throw $_.Exception.Message
    }
}
# If the file already exists, show the message and replace it.
 else {
		 Get-Item -Path $PROFILE | Move-Item -Destination oldprofile.ps1
		 Invoke-RestMethod https://raw.githubusercontent.com/Markov-Komarov/mk-powershell/main/profile.ps1 -o $PROFILE
		 Write-Host "The profile @ [$PROFILE] has been created and old profile removed."
		 
		 Invoke-WebRequest https://raw.githubusercontent.com/Markov-Komarov/mk-powershell/main/starship.toml -o "$HOME\Documents\PowerShell\starship.toml"
		 Write-Host "The starship config @ [$env:userprofile + "\Documents\Powershell"] has been created."
 }
& $profile

# Font Install
# You will have to extract and Install this font manually
# You will also need to set your Nerd Font of choice in your window defaults or in the Windows Terminal Settings.
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip?WT.mc_id=-blog-scottha -o Meslo.zip

# Choco install
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Starship Install
#
choco install starship

# Terminal Icons Install
#
Install-Module -Name Terminal-Icons -Repository PSGallery
