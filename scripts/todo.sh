#!/usr/bin/env bash

MATCHES="$(grep -h "[TODO|FIXME]:" ${DOTFILE_BASE}/setup.sh ${DOTFILE_BASE}/scripts/* | sed -E 's/^[[:space:]]*#/\*/')"
OUTPUT="${DOTFILE_BASE}/TODO.md"

echo '# TODO' > ${OUTPUT}
echo >> ${OUTPUT}
echo 'Auto-generated by `scripts/todo.sh`' >> ${OUTPUT}
echo >> ${OUTPUT}
echo "${MATCHES}" >>  ${OUTPUT}

cat ${OUTPUT}
