#! /bin/bash -e

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${THIS_DIR}/../_common.sh

set +e
toolbox/gpu-operator/undeploy_from_operatorhub.sh
toolbox/gpu-operator/undeploy_with_helm.sh

exec bash ./roles/nv_gpu_install_from_commit/files/helm_deploy_operator.sh cleanup
