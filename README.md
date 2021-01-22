# How to Setup Go on a Raspberry Pi

How to quickly install or update GoLang on a Raspberry Pi.

## Install Go now!

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/cashoefman/How_To_SetUp_Go_On_Raspberry_Pi/HEAD/getgo.sh)"
```

Paste that in a Raspberry Pi Terminal shell prompt. The script explains what it will do and then pauses before it does it.

## Set Path variables

### for zsh
echo export PATH="$PATH:/usr/local/go/bin" >> $HOME/.zshrc
echo export GOPATH="$HOME/golang" >> $HOME/.zshrc
source $HOME/.zshrc

### for bash
echo export PATH="$PATH:/usr/local/go/bin" >> $HOME/.profile
echo export GOPATH="$HOME/golang" >> $HOME/.profile
source $HOME/.profile

### Upgrades

If you want to upgrade to a newer version of Go, remove the older installed version first with 'sudo rm -r /usr/local/go'

