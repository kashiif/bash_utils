alias kc='kubectl'
alias kc-staging-logs='kail --svc staging-wolverine-credit-service --since 15m'
alias kc-what='basename $KUBECONFIG'
#alias kc-use-bcaas-old-staging='export KUBECONFIG=/Users/kkhan/.kube/bcaas-old-staging-conf'
#alias kc-use-bcaas-old-prod='export KUBECONFIG=/Users/kkhan/.kube/bcaas-old-prod-conf'
alias kc-use-bcaas-staging-green='export KUBECONFIG=/Users/kkhan/.kube/bcaas-staging-green-conf'
alias kc-use-bcaas-production-green='export KUBECONFIG=/Users/kkhan/.kube/bcaas-production-green-conf'
alias kc-use-caas-customer-staging-green='export KUBECONFIG=/Users/kkhan/.kube/caas-customer-staging-green-conf'
alias kc-use-caas-customer-production-green='export KUBECONFIG=/Users/kkhan/.kube/caas-customer-production-green-conf'
alias kc-use-devx-staging-green='export KUBECONFIG=/Users/kkhan/.kube/devx-staging-green-conf'
alias kc-use-devx-production-green='export KUBECONFIG=/Users/kkhan/.kube/devx-production-green-conf'

alias kcgp='kc get pods'
alias kcgpy='kc get pod -o yaml'
alias kcgd='kc get deployments'
alias kcgdy='kc get deployment -o yaml'
alias kcgcj='kc get cronjob'
alias kcgcjy='kc get cronjob -o yaml'
alias kcgj='kc get job -o yaml'

alias kclf='kc logs -f'

alias kc-get-staging-wolverine='kc get pods | grep staging-wolverine-credit-service'

kc-patch-secret() {
  if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ] ; then
    echo "Syntax kc-patch-secret <secret-name> <key> <plain-value>";
    return 1;
  fi

  kubectl patch secret "$1" -p="{ \"data\" : { \"$2\": \"$(echo -n $3 | base64 -w0)\" } }"
}

kc-show-secret-data() {
  if [ "$1" = "" ] ; then
    echo "Syntax kc-show-secret-data <secret-name>";
    return 1;
  fi

  kubectl get secret "$1" -o json \
    | jq '.data'
}

kc-show-secret-values() {
  if [ "$1" = "" ] ; then
    echo "Syntax kc-show-secret-values <secret-name>";
    return 1;
  fi

  kubectl get secret "$1" -o json \
    | jq '.data' \
    | while read line; do echo "$(echo $line | cut -d ':' -f 1)": "$(echo $line | cut -d ':' -f 2 | base64 -d)"; done
}
