################ Workplace related ######################

CURRENT_DIR="$( dirname ${BASH_SOURCE[0]} )"

export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH:/Users/kkhan/Library/Python/2.7/bin/"

# Authenticate the user by setting MFA
# source "${CURRENT_DIR}/../../../dev-tools/awsmfa.sh";

# export PGUSER=bcaas_owner
# export PGPASSWORD=empty_password
# export PGUSER=bcaas_owner
# export PGPASSWORD=empty_password
# export PGDATABASE=bcaas

alias make3='/usr/bin/make'

export BCAAS_LOCAL_DB_PASSWORD=empty_password

alias dockerutil='docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v ~/.aws:/root/.aws	-v ~/.helm:/root/.helm -v ~/.kube:/root/.kube -v ~/dockerutil:/dockerutil -e KUBECONFIG="/root/.kube/$(basename ${KUBECONFIG})" 434875166128.dkr.ecr.us-east-1.amazonaws.com/msts/docker:19.03.5-dind.1'

