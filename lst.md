kubectl exec -it metastore-db-5df5579f79-jvqp6 -- psql -U pgadmin -d metastoreDB


trino.default.svc.cluster.local

PO=$(kubectl get pods | grep 'trino-coordinator' | awk '{print $1}') && ke "$PO" -- trino


openssl x509 -in combined.pem -noout -text
kubectl create secret generic trinoid-secret --from-file=trinoid.pem

kubectl create secret tls trinoid-secret --cert=t.crt --key=t.key

kubectl get secret pgadmin-tls-secret -o jsonpath="{.data['tls\.crt']}" | base64 --decode > pgadmin-cert.pem
kubectl get secret pgadmin-tls-secret -o jsonpath="{.data['tls\.key']}" | base64 --decode > pgadmin-key.pem