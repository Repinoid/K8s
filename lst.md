 kubectl get all
NAME                                      READY   STATUS    RESTARTS   AGE
pod/pgadmin-deployment-7d67cf59bd-vxpmz   1/1     Running   0          6h24m

NAME                       TYPE           CLUSTER-IP      EXTERNAL-IP                                                                 PORT(S)        AGE
service/kubernetes         ClusterIP      10.96.0.1       <none>                                                                      443/TCP        14h
service/pgadmin-service    NodePort       10.96.231.191   <none>                                                                      80:30081/TCP   6h24m
service/postgres-service   ExternalName   <none>          postgresqlk8s.5e71c188-e989-42d7-89ff-cc623d04f066.svc.k8s-3.ext.nubes.ru   <none>         6h12m

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/pgadmin-deployment   1/1     1            1           6h24m

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/pgadmin-deployment-7d67cf59bd   1         1         1       6h24m