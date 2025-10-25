kubectl exec -it metastore-db-5df5579f79-jvqp6 -- psql -U pgadmin -d metastoreDB

helm pull bitnami/postgresql --untar

helm install mdb bitnami/postgresql --values val.yaml

trino.default.svc.cluster.local