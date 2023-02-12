gotowork() {
  session_name="work"
  start_directory="~/work/front-react/"
  secondary_directory="~/work/backend/"

  firefox_start work

  # check if the session already exists
  if tmux has-session -t "$session_name"; then
    # attach to the existing session
    tmux attach-session -t "$session_name"
  else
    # create a new tmux session with the desired name
    tmux new-session -d -s "$session_name"

    # change the current directory to the start directory
    tmux send-keys "cd $start_directory" C-m
    tmux send-keys "clear" C-m
    tmux send-keys "nvim ." C-m

    # split the first window into three panes vertically
    tmux split-window -v
    tmux split-window -h

    # Resize top pane
    tmux select-pane -t 0
    tmux resize-pane -y 80%

    # select the first pane
    tmux select-pane -t 1
    tmux send-keys "cd $start_directory" C-m
    tmux send-keys "clear" C-m
    tmux send-keys "npm run dev" C-m

    # select the second pane
    tmux select-pane -t 2
    tmux send-keys "cd $start_directory" C-m
    tmux send-keys "clear" C-m
    
    # Zoom the first pane
    tmux select-pane -t 0
    tmux resize-pane -Z

    # create the second window
    tmux new-window -t "$session_name"

    # change the current directory to the start directory
    tmux send-keys "cd $secondary_directory" C-m
    tmux send-keys "clear" C-m
    tmux send-keys "nvim ." C-m

    tmux select-window -t 0

    # attach to the tmux session
    tmux attach-session -t "$session_name"
  fi
}
