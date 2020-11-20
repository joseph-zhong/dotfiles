# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

# Push-Location (Split-Path -parent $profile)
# "components","functions","aliases","exports","extra" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
# Pop-Location

Function New-File {New-Item -ItemType file @args}
New-Alias -Name "touch" -Value New-File

Function Clear {clear}
New-Alias -Name "cl" -Value Clear

Function s2 { cd ~/work/src2 }
Function w2 { cd ~/work/ }

Function df1 { cd ~/dotfiles/ }
Function v1 { cd ~/.vim_runtime/ }

Function cdc { cd ~ }
