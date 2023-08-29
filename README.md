# mk-powershell
My personal configuration and customization for PowerShell.
Pleas note that this is based on [ChrisTitusTech Powershell](https://github.com/ChrisTitusTech/powershell-profile/) profile.
It has been modified by me for my personal usage and liking.

The main change it's the prompt preference, changing it from Oh-My-Posh to Starship for better performance and shorter loading times.
Unused fuctions have been removed.

## One Command Install (Admin PowerShell Recommended)

Execute the following command in an elevated PowerShell window to install the PowerShell profile:

```
irm "https://raw.githubusercontent.com/Markov-Komarov/mk-powershell/main/setup.ps1" | iex
```

## Fix the Missing Font

After running the script, you'll find a downloaded `Meslo.zip` file in the folder you executed the script from. Follow these steps to install the required nerd fonts:

1. Extract the `Meslo.zip` file.
2. Locate and install the nerd fonts.

Enjoy a minimalistic and enhanced Powershell experience!
