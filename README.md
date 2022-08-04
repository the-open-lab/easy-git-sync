# Easy Git Sync
Easy Git synchronization for all local branches with [PowerShell 7](https://github.com/PowerShell/PowerShell) and [Expect](https://github.com/hymkor/expect).

## Impetus

Keeping all local branches up-to-date with their respective remote branches can be tiresome when rebasing and merging multiple branches. The original idea of this script was to provide a simple alias for PowerShell to sync all local branches, and it solves that problem by itself swimmingly.

However, the organization where I work requires public key Git access with a PIN. This caused a lot of manual interaction while running the "automated" sync. Hence, the need for the Expect program to send the PIN when prompted.

## Usage

1. To get started with these scripts, you will first need to add an environment variable called `PIN` with a value of the passphrase you set for your public key. You can alternatively name this environment variable differently, but be sure to change the value of the expected environment variable in `git-sync.ps1`.
2. While editing your environment variables, add the location of the Expect executable to your `PATH` variable so that it can be called by name.
3. Source the `sync.ps1` file from your PowerShell profile:
   ```
   $scripts = Join-Path -Path $PSScriptRoot "Scripts"
   . $scripts"\sync.ps1"
   ```
The `Git-Sync` commandlet will now be available in all subsequent instances of PowerShell.

## Caveats

* This script expects PowerShell, Expect, and Git to already be installed
* This script expects the working directory to be a Git repository; if it's not, you'll get an error from Git explaining such
* This script expects the working directory to be clean (no current changes in Git); you can call `git stash` first if necessary
* This script expects the Git executable to be installed at `C:\Program Files\Git\bin\git.exe` (modify accordingly in the file `pull.lua` on line 7)
* This script expects the file name of your public key to end in `ed25519` (modify accordingly in the file `pull.lua` on line 8)

## License

This is free software, built on the shoulders of previous free software. You are both free and encouraged to copy, share, and remix this work, in accordance with the [Free Art License](LICENSE.md).

<img src="art-libre.svg" title="This is free software" alt="">