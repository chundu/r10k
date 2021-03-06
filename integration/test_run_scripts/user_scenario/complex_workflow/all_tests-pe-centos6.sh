#!/bin/bash
SCRIPT_PATH=$(pwd)
BASENAME_CMD="basename ${SCRIPT_PATH}"
SCRIPT_BASE_PATH=`eval ${BASENAME_CMD}`

if [ $SCRIPT_BASE_PATH = "complex_workflow" ]; then
  cd ../../../
fi

export pe_dist_dir=http://pe-releases.puppetlabs.lan/3.7.1/

beaker \
  --preserve-hosts onfail \
  --config configs/pe/centos-6-64mda \
  --debug \
  --tests tests/user_scenario/complex_workflow \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --pre-suite pre-suite/pe_install.rb,pre-suite/pe_r10k.rb \
  --load-path lib
