#devx
tfstatelock-qa-get() {
  if [ "$1" = "" ] ; then
    echo "Usage: tfstatelock-qa-get <LockID-From-Terraform-Error-Message>";
    return 1;
  fi

  #  Working
  #  cat kk-tests.json | jq ".Items[] | select(.Info != null) | select(.Info.S != null) | select(.Info.S | contains(\"$1\"))";
  aws dynamodb scan --table-name caasdevx-qa-terraform-state | jq ".Items[] | select(.Info != null) | select(.Info.S != null) | select(.Info.S | contains(\"$1\"))";

  RECORD_KEY=`aws dynamodb scan --table-name caasdevx-qa-terraform-state | jq ".Items[] | select(.Info != null) | select(.Info.S != null) | select(.Info.S | contains(\"$1\")) | .LockID.S"`;
  echo "RECORD_KEY: $RECORD_KEY"
}

tfstatelock-qa-del() {
  if [ "$1" = "" ] ; then
    echo "Usage: tfstatelock-qa-del <LockID-From-Terraform-Error-Message>";
    return 1;
  fi

  #  Working, has additional filter at end: '| .LockID.S'
  #  cat kk-tests.json | jq ".Items[] | select(.Info != null) | select(.Info.S != null) | select(.Info.S | contains(\"$1\")) | .LockID.S";
  RECORD_KEY=`aws dynamodb scan --table-name caasdevx-qa-terraform-state | jq ".Items[] | select(.Info != null) | select(.Info.S != null) | select(.Info.S | contains(\"$1\")) | .LockID.S"`;
  echo "RECORD_KEY: $RECORD_KEY"
  aws dynamodb delete-item --table-name caasdevx-qa-terraform-state --key "{ \"LockID\": {\"S\":$RECORD_KEY} }"
}


function kc-show-secret() {

  if [ "$1" = "" ] ; then
    echo "Usage: kc-show-secret <secret_name>";
    return 1;
  fi

  SECRET_NAME=$1
  kubectl get secret -o json $SECRET_NAME | jq '.data' | jq 'map_values(@base64d)'
}