kubectl exec -it metastore-db-5df5579f79-jvqp6 -- psql -U pgadmin -d metastoreDB


trino.default.svc.cluster.local

PO=$(kubectl get pods | grep 'trino-coordinator' | awk '{print $1}') && ke "$PO" -- trino


openssl x509 -in combined.pem -noout -text
kubectl create secret generic trino-cert --from-file=combined.pem

kubectl create secret tls tls-secret --cert=tls.crt --key=tls.key

kubectl get secret pgadmin-tls-secret -o jsonpath="{.data['tls\.crt']}" | base64 --decode > pgadmin-cert.pem
kubectl get secret pgadmin-tls-secret -o jsonpath="{.data['tls\.key']}" | base64 --decode > pgadmin-key.pem