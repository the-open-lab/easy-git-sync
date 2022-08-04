-- Execute git pull and send the supplied PIN when prompted
-- @param git       The absolute path to the Git executable (defaults to "C:\Program Files\Git\bin\git.exe")
-- @param branch    The name of the branch to checkout
-- @param pattern   The value to await from the Git server before sending the vale of the `pin` parameter (defaults to "ed25519':")
-- @param pin       The PIN to pass to the Git server when prompted
function pull(git, branch, pattern, pin)
    git = git or [[C:\Program Files\Git\bin\git.exe]]
    pattern = pattern or "ed25519':"

    echo("Checking out " .. branch)
    os.execute("git checkout " .. branch)
    echo("Awaiting prompt for PIN entry")
    if spawn (git, "pull", "-p") then
        expect(pattern)
        send(pin .. '\n')
    end
end
pull(nil, arg[1], nil, arg[2])