firefox_start() {
  profile=$1

  if ps -ef | grep firefox | grep -v grep | grep -q -- "-P $profile"; then
  else
    killall firefox
    firefox -P "$profile" >/dev/null 2>&1 & disown
  fi
}
