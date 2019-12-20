#!/bin/bash
# Ghetto sanitization - remove "/" first then replace everything else with "_"
SANITIZED=$(echo ${1} | sed 's/\///g' | sed 's/[^a-zA-Z0-9_\-\.]/_/g')
ARCV=${SANITIZED}.tar.gz
SUM=${SANITIZED}.SHA265SUM
# Get archive and sha256sum
tar -zcvf ${ARCV} ${1}
sha256sum ${ARCV} > ${SUM}
# Base64 encode
cat ${ARCV} | base64 > ${ARCV}.b64
cat ${SUM} | base64 > ${SUM}.b64
# Send to Vault
vault kv put ops/files/${SANITIZED} file=@${ARCV}.b64 shasum=@${SUM}.b64
# Clean up
rm -v ${ARCV} ${ARCV}.b64 ${SUM} ${SUM}.b64