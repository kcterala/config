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
