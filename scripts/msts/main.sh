################ Workplace related ######################

CURRENT_DIR="$( dirname ${BASH_SOURCE[0]} )"

export PATH=$PATH:/Users/kkhan/Library/Python/2.7/bin/
alias mount-audev04="/usr/local/bin/sshfs audev04: ~/remotes/audev04 -o volname=audev04 -o follow_symlinks &"

# source "${CURRENT_DIR}/aws-mfa.sh";

alias q='OPEN_BROWSER=false quasar dev mat'