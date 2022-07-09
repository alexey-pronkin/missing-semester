# Lesson 5

## RollingUpdate

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: goapp-deployment
  namespace: rolling
  labels:
    app: goapp
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
  selector:
#####отрывок манифеста#####
```

## Rollout

```bash
kubectl rollout history deployment/goapp-deployment     # Проверить историю деплоймента
kubectl rollout undo deployment/goapp-deployment        # Откатиться к предыдущей версии деплоймента
kubectl rollout restart deployment/goapp-deployment     # Плавающий рестарт Подов в деплойменте 
```

## DaemonSet

Возьмем абсолютно реальный пример из жизни. Есть База Данных ElasticSearch, визуальный интерфейс для взаимодействия с этой базой Kibana и сборщик логов Fluentd.

Fluentd деплоится на Ноду и собирает логи, которые Поды пишут в stdout (в поток вывода).

Как нам задеплоить fluentd на все Ноды нашего кластера?  Использовать daemonSet:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-elasticsearch
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd-elasticsearch
  template:
    metadata:
      labels:
        name: fluentd-elasticsearch
    spec:
      containers:
      - name: fluentd-elasticsearch
        image: quay.io/fluentd_elasticsearch/fluentd:v2.5.2
```

Другие примеры из жизни - [k8s-pinger](https://github.com/MadEngineX/k8s-pinger), [goldpinger](https://github.com/bloomberg/goldpinger).

То есть контроллер ДемонСет поддерживает по одной реплике Пода на каждой из Нод кластера, в этом вся его суть.

## Job

Первый контроллер в Kubernetes. Джоба поднимает под, отрабатывает и помирает до следующего запуска.

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4
```

Это пример из официальной документации Кубернетеса. Данная Джоба запускает под, который вычитывает 2000 знаков после запятой у числа Пи. Задеплойте Джобу через kubectl apply, дождитесь отработки Пода (статус Completed) и посмотрите на логи:

```bash
kubectl get pod -o wide
kubectl logs pi-wc44k
```

> Can't use an undefined value as an ARRAY reference at /usr/local/lib/perl5/5.36.0/Math/BigInt/Calc.pm line 1049.

## CronJob

Если Вам понадобится Джоба, которая должна запускаться по расписанию, используйте механизм CronJob.
