#!/bin/bash
# Ghetto sanitization - remove "/" first then replace everything else with "_"
SANITIZED=$(echo ${1} | sed 's/\///g' | sed 's/[^a-zA-Z0-9_\-\.]/_/g')
ARCV=${SANITIZED}.tar.gz
SUM=${SANITIZED}.SHA265SUM
# Get archive and sha256sum
vault kv get -field file ops/files/${SANITIZED} | base64 -d > ${ARCV}
vault kv get -field shasum ops/files/${SANITIZED} | base64 -d > ${SUM}
# Validate sha256sum
sha256sum -c ${SUM}