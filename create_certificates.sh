#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CA_DIR=/work/ca
KEYSTORE_FILE=/work/keystore.jks
CLIENT_CERT_KEYSTORE=/work/client-cert.jks

if [[ -f ${KEYSTORE_FILE} ]] ; then
    rm -Rf ${KEYSTORE_FILE}
fi

if [[ -f ${CLIENT_CERT_KEYSTORE} ]] ; then
    rm -Rf ${CLIENT_CERT_KEYSTORE}
fi


KEYTOOL=keytool

if [  ! -x "${KEYTOOL}" ] ; then
   KEYTOOL=${JAVA_HOME}/bin/keytool
fi

if [  ! -x "${KEYTOOL}" ] ; then
   echo "[ERROR] No keytool in PATH/JAVA_HOME"
   exit 1
fi


#${KEYTOOL} -importcert -keystore ${KEYSTORE_FILE} -file ${CA_DIR}/certs/ca.cert.pem -noprompt -storepass changeit
${KEYTOOL} -keystore ${JAVA_HOME}/lib/security/cacerts -trustcacerts \
  -importcert -alias "my-root-ca" -file ${CA_DIR}/certs/ca.cert.pem -noprompt -storepass changeit
${KEYTOOL} -importkeystore \
                              -srckeystore ${CA_DIR}/app3.p12 -srcstoretype PKCS12 -srcstorepass changeit\
                              -destkeystore ${JAVA_HOME}/lib/security/cacerts -deststoretype jks \
                              -noprompt -storepass changeit
ls ${CA_DIR}
