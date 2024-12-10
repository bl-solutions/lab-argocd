#!/usr/bin/env bash

parse_args() {
  ACTION="${1}"
  CLUSTER_NAME="${2:-vault}"
}

exists() {
  kind get clusters | grep -q "${CLUSTER_NAME}"

  if [ "$?" -eq "0" ]
  then
    echo 1
    return
  fi

  echo 0
  return
}

parse_args "$@"

case $ACTION in
  "create")
    if [ "$(exists)" -eq "1" ]
    then
      echo "The cluster \"${CLUSTER_NAME}\" already exists, skipping"
    else
      kind create cluster --name "${CLUSTER_NAME}"
    fi
    ;;

  "delete")
    if [ "$(exists)" -eq "0" ]
    then
      echo "The cluster \"${CLUSTER_NAME}\" not exists, skipping"
    else
      kind delete cluster --name "${CLUSTER_NAME}"
    fi
    ;;

  *)
    echo "${ACTION} not supported"
    exit 1
    ;;
esac
