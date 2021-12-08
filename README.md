## online deployment

```
## template
. deployment/online_deploy.sh <version> <yaml>

## sample: deploy v2.1.0 using default config
. deployment/online_deploy.sh v2.1.0 

## sample: deploy v2.1.0 using custom config
. deployment/online_deploy.sh v2.1.0 sample.yaml
```

## offline deployment

### step1: import images

execute at every worker.

```
. utils/load_images.yaml <version>
```

### step2: install operator

```
tar -xvzf charts/mysql-operator-<version>.tgz
helm install <release name> charts/mysql-operator
```

### step3: install mysqlcluster

```
kubectl apply -f sample/mysqlcluster_<version>.yaml
```

## configuration

### pod affinity (required)


### local pv (Optional, recommended)

## utils

### export mysql yaml

```
. utils/export_config.sh <name> <ns>
```