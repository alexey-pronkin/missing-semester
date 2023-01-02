# Команды

docker volume ls — вывести список вольюмов (ссылка)

docker volume create <название> — создать вольюм (ссылка)

docker volume rm <название> — удалить вольюм (ссылка)

docker volume prune — удалить вольюмы, которые не используются контейнерами (ссылка)

# Bind mount:

docker run -v <полный*путь*на*хосте>:<полный*путь*в*контейнере> <образ>

# Volume:

docker run -v <название*вольюма>:<полный*путь*в*контейнере> <образ>

Readonly режим
docker run -v <полный*путь*на*хосте>:<полный*путь*в*контейнере>:ro <образ>

# Docker-in-Docker

А теперь давайте познакомимся с очень интересной концепцией Docker-in-Docker.

При помощи bind mount можно прокинуть сокет докера, в результате чего мы получим доступ к демону внутри контейнера.

Такое может понадобиться, например, в CI/CD (про это поговорим в последнем уроке). Если кратко — нужно уметь внутри контейнера запускать, например, сборку образа (docker build).

При этом такой подход довольно опасен, поэтому нужно быть очень аккуратным!

Подробнее можно посмотреть вот тут:

stackoverflow https://stackoverflow.com/questions/35110146/can-anyone-explain-docker-sock
оригинал статьи https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
перевод статьи https://habr.com/ru/company/ua-hosting/blog/488536/
Давайте всё же попробуем это потрогать 🙂

Для этого нам понадобится образ ... докера. Да, такой есть — ссылка.

А также нужно будет сделать bind mount как раз сокета (-v /var/run/docker.sock:/var/run/docker.sock).

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock docker

На хосте остановите и удалите контейнер с редисом, если он у вас поднят (docker stop redis и docker rm redis). В общем чтоб у вас не было конфликта имен.

Затем зайдите в этот контейнер и выполните команду docker run --rm -d --name redis redis.

Что получится в результате?

На хосте появится контейнер с именем redis

docker run -d
docker run -d -v home:docker
docker ps
docker stop

# list of all volumes

docker volume ls
docker volume create test_vol_1
docker volume rm test_vol_1

# remove all not used by contaners

docker volume prune
docker volume inspect test_vol_1
