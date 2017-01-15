oc adm policy add-scc-to-user anyuid -z ribbon
oc create -f http://central.maven.org/maven2/io/fabric8/kubeflix/packages/kubeflix/1.0.17/kubeflix-1.0.17-kubernetes.yml
oc new-app kubeflix
oc expose service hystrix-dashboard
oc patch route hystrix-dashboard -p '{"spec": { "port": { "targetPort": 8080 } } }'
oc policy add-role-to-user admin system:serviceaccount:$(oc project -q):turbine
