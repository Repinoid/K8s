kubectl apply -f metastore-pg/postgres-pvc.yaml
kubectl apply -f metastore-pg/postgres-config.yaml
kubectl apply -f metastore-pg/postgres-deployment.yaml
kubectl apply -f metastore-pg/postgres-service.yaml

