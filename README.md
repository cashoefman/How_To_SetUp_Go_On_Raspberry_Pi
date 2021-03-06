# How to Setup Go on a Raspberry Pi

Of course Raspberry Pi's Raspbian has it's Debian package manager and you can indeed use that to install GO on you Raspberry Pi. However that is an older version of Go, so here is a way to to quickly install or update GoLang on a Raspberry Pi with the latest version.

![GO Now](images/GoOnPi.jpg)

## Install Go now!

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cashoefman/How_To_SetUp_Go_On_Raspberry_Pi/HEAD/getgo.sh)"
```

Paste that in a Raspberry Pi Terminal shell prompt. The script explains what it will do and then pauses before it does it.

## Set Path variables
To make things work properly you will have to set a few variables in the appropriate file, here are a few examples:

### for zsh
```
echo export PATH="$PATH:/usr/local/go/bin" >> $HOME/.zshrc
echo export GOPATH="$HOME/golang" >> $HOME/.zshrc
source $HOME/.zshrc
```

### for bash
```
echo export PATH="$PATH:/usr/local/go/bin" >> $HOME/.profile
echo export GOPATH="$HOME/golang" >> $HOME/.profile
source $HOME/.profile
```

## Testing it!
Now to quickly test and see if it all works type 'go version'

![Terminal](images/terminal1.jpg)

### Upgrades

If you want to upgrade to a newer version of Go, remove the older installed version first with 'sudo rm -r /usr/local/go'

