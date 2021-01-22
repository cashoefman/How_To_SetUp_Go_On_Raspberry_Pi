#!/bin/bash
set -u

abort() {
  printf "%s\n" "$1"
  exit 1
}


# First check OS.
OS="$(uname)"
MACHINE="$(uname -m)"
if [[ "$OS" != "Linux" ]]; then
  abort "This installer only supports Linux on Raspberry Pi."
fi
if [[ "$MACHINE" != "armv7l" ]]; then
  abort "This installer only supports Raspberry Pi."
fi

getc() {
  local save_state
  save_state=$(/bin/stty -g)
  /bin/stty raw -echo
  IFS= read -r -n 1 -d '' "$@"
  /bin/stty "$save_state"
}

wait_for_user() {
  local c
  echo
  echo "Press RETURN to continue or any other key to abort"
  getc c
  # we test for \r and \n because some stuff does \r instead
  if ! [[ "$c" == $'\r' || "$c" == $'\n' ]]; then
    exit 1
  fi
}

echo
echo "Are you ready to download Go?"
wait_for_user

echo "Downloading..."

# Get the URL for the latest version
export GOURL="$(curl https://golang.org/dl/|grep armv6l|grep -v beta|head -1|awk -F\> {'print $3'}|awk -F\< {'print $1'})"
# Download the latest armv6 version
wget https://golang.org/dl/$GOURL
echo "Download Complete"
# Install it!
echo
echo "If you continue this installer will install an the latest ARMV6L version of Go"
echo "Please confirm, you are you ready to proceed"
wait_for_user

echo "Installing..."
sudo tar -C /usr/local -xzf $GOURL
# Cleanup
rm $GOURL
unset GOURL
echo "Install Completed"
echo
echo "Don't forget to add path variables"
echo
