gotodev() {
  session_name="dev"
  start_directory="~/personal/"

  firefox_start dev

  echo $session_name
  if tmux has-session -t "$session_name"; then
    tmux attach-session -t "$session_name"
  else
    tmux new-session -d -s "$session_name"

    tmux send-keys "cd $start_directory" C-m
    tmux send-keys "clear" C-m

    tmux split-window -v

    tmux select-pane -t 0
    tmux resize-pane -y 80%

    tmux select-pane -t 1
    tmux send-keys "cd $start_directory" C-m
    
    tmux select-pane -t 0
    tmux resize-pane -Z

    tmux select-window -t 0

    tmux attach-session -t "$session_name"
  fi
}
