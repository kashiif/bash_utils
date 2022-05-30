################ Workplace related ######################

CURRENT_DIR="$( dirname ${BASH_SOURCE[0]} )"

export PATH=$PATH:/Users/kkhan/Library/Python/2.7/bin/
alias mount-audev04="/usr/local/bin/sshfs audev04: ~/remotes/audev04 -o volname=audev04 -o follow_symlinks &"

# Authenticate the user by setting MFA
# source "${CURRENT_DIR}/../../../dev-tools/awsmfa.sh";

alias q='OPEN_BROWSER=false quasar dev mat'
alias f='flyway'
alias link-tenant='cd node_modules/ && rm -rf horizon-saas-ui-tenant-config && ln -s ../../horizon-saas-ui-tenant-config && cd ..'
alias link-styles='cd node_modules/ && rm -rf horizon-vue-common-styles && ln -s ../../../horizon-vue-common-styles && cd ..'
alias run-local-pg='docker run -d -p 5432:5432 local-pg'

alias kc='kubectl'
alias kc-staging-logs='kail --svc staging-wolverine-credit-service --since 15m'
alias kc-what='basename $KUBECONFIG'
alias kc-use-bcaas-old-staging='export KUBECONFIG=/Users/kkhan/.kube/bcaas-old-staging-conf'
alias kc-use-bcaas-old-prod='export KUBECONFIG=/Users/kkhan/.kube/bcaas-old-prod-conf'
alias kc-use-bcaas-staging-green='export KUBECONFIG=/Users/kkhan/.kube/bcaas-staging-green-conf'
alias kc-use-bcaas-production-green='export KUBECONFIG=/Users/kkhan/.kube/bcaas-production-green-conf'
alias kc-get-staging-wolverine='kc get pods | grep staging-wolverine-credit-service'

# export PGUSER=bcaas_owner
# export PGPASSWORD=empty_password
# export PGUSER=bcaas_owner
# export PGPASSWORD=empty_password
# export PGDATABASE=bcaas

export BCAAS_LOCAL_DB_PASSWORD=empty_password

alias dockerutil='docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v ~/.aws:/root/.aws	-v ~/.helm:/root/.helm -v ~/.kube:/root/.kube -v ~/dockerutil:/dockerutil -e KUBECONFIG="/root/.kube/$(basename ${KUBECONFIG})" 434875166128.dkr.ecr.us-east-1.amazonaws.com/msts/docker:19.03.5-dind.1'
