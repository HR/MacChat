#!/bin/bash
################################################################################
# Mac-Mac P2P Chat via ssh                                                     #
# (C) Habib Rehman 2XXX.                                                       #
# MIT license                                                                  #
################################################################################

LOG=false # Do not log by default
TO="Recipient" # Default recipient
FROM="Me" # Default sender

function showOpts {
  echo "options:"
  echo "     -h  show this help text"
  echo "     -t  Recipient name"
  echo "     -f  Sender name"
  echo "     -l  Log chat"
}
# Get args
while getopts 't:f:lh' flag; do
  case "${flag}" in
    l)
      LOG=true
      LOG_FNAME="$FROM-$TO `date` chat.log"
      printf "=== $FROM-$TO chat log ===" >> "$LOG_FNAME"
      ;;
    t) TO="${OPTARG}" ;;
    f) FROM="${OPTARG}" ;;
    h)
      showOpts
      exit
    ;;
    *)
      echo "Unexpected option ${flag}"
      showOpts
      exit
    ;;
  esac
done

while [[ true ]]; do
  # Read message
  read -r -p "$FROM: " MESSAGE
  if [[ "$MESSAGE" != 'exit' ]]; then
    # Show dialog and get reply
    REPLY=$(osascript -e "return \"$TO: \" & text returned of (display dialog \"$FROM: $MESSAGE\" with title \"Chat\" default answer \"\" buttons {\"Reply\"} default button 1)")
    echo $REPLY
    if [[ "$LOG" == true ]]; then
      # log message and reply
      printf "\n$FROM: $MESSAGE\n$REPLY" >> "$LOG_FNAME"
    fi
  else
    break
  fi
done

# Execute this from local on remote by running
# $ ssh user@host.local "bash -s" < ./chat.sh "arg1" "arg2" "arg3"