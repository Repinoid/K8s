kubectl exec -it metastore-db-5df5579f79-jvqp6 -- psql -U pgadmin -d metastoreDB


trino.default.svc.cluster.local

PO=$(kubectl get pods | grep 'trino-coordinator' | awk '{print $1}') && ke "$PO" -- trino

kubectl create secret generic trino-certs --from-file=cert.pem

uI3PwzmwWZioj0GD77PQQJg7ybxkrRAoS4e08fBq