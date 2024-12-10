#!/usr/bin/env bash

KUSTOMIZE_DIR="config/argocd"

parse_args() {
  CONTEXT="${1}"
  ACTION="${2}"
}

parse_args "$@"

case $ACTION in
  "install")
    kubectl --context "${CONTEXT}" apply -k "${KUSTOMIZE_DIR}"
    ;;

  "uninstall")
    kubectl --context "${CONTEXT}" delete -k "${KUSTOMIZE_DIR}"
    ;;

  "expose")
    kubectl --context "${CONTEXT}" -n argocd port-forward svc/argocd-server 8080:80
    ;;

  *)
    echo "${ACTION} not supported"
    exit 1
    ;;
esac
