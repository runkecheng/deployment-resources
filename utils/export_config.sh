name=$1
ns=$2
cat>mysql_cluster.yaml<<EOF
apiVersion: mysql.radondb.com/v1alpha1
kind: MysqlCluster
metadata:
  name: $name
EOF
kubectl get mysql $name -n $ns -o yaml > temp.yaml
status_num=$(sed -n '/status:/=' temp.yaml | head -1)
let status_num=$status_num-1
spec_num=$(sed -n '/spec:/=' temp.yaml)
sed -n "${spec_num},${status_num}p" temp.yaml >> mysql_cluster.yaml
rm temp.yaml


