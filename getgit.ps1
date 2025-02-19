Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Add-PoshGitToProfile -AllHosts
git

