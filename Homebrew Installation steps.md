#  Steps to install homebrew into macOS
Link is below: 
    https://stackoverflow.com/a/66019047
    
    
Or
        for this error zsh: command not found: brew
Make sure you've installed Brew, with this (wait until its done installing) (Edit: added ending quote to the end)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Then follow NEXT STEPS shown on command line, it should show something like this
==> Next steps:
- Add Homebrew to your PATH in /Users/$USER/.zprofile:
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)
Copy and paste the first line on the same terminal window, then hit enter
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
Then Copy and paste the last line on the same terminal window, then hit enter
eval $(/opt/homebrew/bin/brew shellenv)
Finally you should be able to use brew help and if that works, it means that brew was installed properly and running from ZSH.


    
    

