#!/bin/sh
PASS=$( echo -n eucalyptus | openssl dgst -sha256 \
        -sign ${EUCALYPTUS}/var/lib/eucalyptus/keys/cloud-pk.pem \
        -hex | sed 's/.*= //' )

echo "update config_clusters set maxvlan=1000;" | \
    mysql -B -u eucalyptus --password=${PASS} --port=8777 \
          --protocol=TCP eucalyptus_config

