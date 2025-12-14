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

