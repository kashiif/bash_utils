function review_git_branch() {

  TARGET_BRANCH_NAME=$1

  if [ -z "$TARGET_BRANCH_NAME" ]; then
      echo "No target branch name supplied"
  else
    git fetch
    git branch -d "$TARGET_BRANCH_NAME"
    git branch -D "$TARGET_BRANCH_NAME"-review
    git checkout "$TARGET_BRANCH_NAME"

    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "Error: Does the branch exist?"
    else
      git checkout -b "$TARGET_BRANCH_NAME"-review
      git merge -m "Merged for review" develop
      git branch -d "$TARGET_BRANCH_NAME"
    fi

  fi
}
