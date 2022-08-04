function Git-Sync {
    <#
        .SYNOPSIS
            Synchronises all local Git branches with their respective remote branch.
        
        .EXAMPLE
            Git-Sync

            This will execute the `git pull -p` command for each local branch in the Git repo of the current directory.
        
        .DESCRIPTION
            This script expects the Expect program to be installed (see Related Links), as it offloads the actual execution of the `git pull -p` command to a separate script running under that program.

        .LINK
            https://github.com/hymkor/expect
    #>
    $pin = $env:PIN
    foreach ($branch in $(git branch --format='%(refname:short)')) {
        $script = Join-Path -Path $PSScriptRoot "pull.lua"
        expect $script $branch $pin
        Write-Host `n""
    }
}