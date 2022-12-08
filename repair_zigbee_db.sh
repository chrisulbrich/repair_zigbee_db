#! /bin/bash
#workdir="./repair_zigbee_db"
workdir="/opt/docker/data/zigbee2mqtt/data/"
filename="database.db"
if [ -f "${workdir}/${filename}" ]; then
  if grep -ao -P '\x00+$' ${workdir}/${filename} ; then
    echo "fixing database ${workdir}/${filename}..."
    timestamp=$(date "+%Y%m%d_%H%M%S")
    suffix="_bak${timestamp}"
    sed -i${suffix} '$ s/\x00*$//' ${workdir}/${filename}
    echo "Fixing done, backup saved to ${workdir}/${filename}${suffix}"
  else
    echo "Database ${workdir}/${filename} seems to be OK."
  fi
else
  echo "Database file doesn't exist in ${workdir}/${filename}"
fi
