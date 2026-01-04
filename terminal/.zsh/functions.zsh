function squashcommit() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "Not a Git repository"; return 1; }
    git add . || { echo "Failed to add changes"; return 1; }
    if ! git commit -m "fix"; then
        echo "Commit failed"
        return 1
    fi

    if ! GIT_SEQUENCE_EDITOR="sed -i -re '2s/^pick/fixup/'" git rebase -i HEAD~2; then
        echo "Squash failed"
        return 1
    fi
}

function commit() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "Not a Git repository"; return 1; }
    if [ -z "$1" ]; then
        echo "Usage: commit <commit message>"
        return 1
    fi

    git add .
    git commit -m "$1"
}

HASH="%C(always,yellow)%h%C(always,reset)"
RELATIVE_TIME="%C(always,green)%ar%C(always,reset)"
AUTHOR="%C(always,bold blue)%an%C(always,reset)"
REFS="%C(always,red)%d%C(always,reset)"
SUBJECT="%s"

FORMAT="$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

function pretty_git_log() {
  git log --graph --pretty="tformat:$FORMAT" "$@" |
  column -t -s '{' |
  less -XRS --quit-if-one-screen
}

# Add current directory as a new window to a tmux session
# Usage: ta [session-name]
# If session-name is provided, adds to that session
# If not provided, adds to the most recent session
function ta() {
  # Check if tmux is running
  if ! tmux list-sessions &>/dev/null; then
    echo "No tmux sessions running. Start tmux first."
    return 1
  fi

  # Get current directory and create window name
  local current_dir="$PWD"
  local window_name=$(basename "$current_dir" | tr '.' '_')

  # Get session: either from argument or most recent
  local session="$1"
  if [ -z "$session" ]; then
    session=$(tmux list-sessions -F '#{session_name}:#{session_created}' | sort -t: -k2 -rn | head -1 | cut -d: -f1)
  else
    # Verify the session exists
    if ! tmux has-session -t "$session" 2>/dev/null; then
      echo "Session '$session' not found."
      echo "Available sessions:"
      tmux list-sessions -F '  - #{session_name}'
      return 1
    fi
  fi

  # Create new window in that session
  tmux new-window -t "$session:" -n "$window_name" -c "$current_dir"

  echo "✓ Added window '$window_name' to session '$session'"
}

