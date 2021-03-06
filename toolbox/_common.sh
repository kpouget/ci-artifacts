TOOLBOX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TOP_DIR=${TOOLBOX_DIR}/..

set -o pipefail
set -o errexit
set -o nounset

ANSIBLE_OPTS="${ANSIBLE_OPTS:--vv}"
INVENTORY_ARG="-i inventory/hosts"

if [ ! -z "${OCP_VERSION:-}" ]; then
    ANSIBLE_OPTS="$ANSIBLE_OPTS -e openshift_release=$OCP_VERSION"
fi

cd $TOP_DIR
