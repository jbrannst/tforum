OCP_DOMAIN=apps.ocp.rocks
OCP_PROJECT=coolstore
MAVEN_MIRROR_URL=
oc new-project $OCP_PROJECT
oc process -f api-gateway.json       MAVEN_MIRROR_URL=${MAVEN_MIRROR_URL} | oc create -f -
oc process -f catalog-service.json   MAVEN_MIRROR_URL=${MAVEN_MIRROR_URL} | oc create -f -
oc process -f inventory-service.json MAVEN_MIRROR_URL=${MAVEN_MIRROR_URL} | oc create -f -
oc process -f cart-service.json      MAVEN_MIRROR_URL=${MAVEN_MIRROR_URL} | oc create -f -
oc process -f ui-service.json        HOSTNAME_HTTP=ui-${OCP_PROJECT}.${OCP_DOMAIN}     API_ENDPOINT=http://api-gateway-${OCP_PROJECT}.${OCP_DOMAIN}/api |     oc create -f -

