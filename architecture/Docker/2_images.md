# Команды

Работа с образами
docker images или docker image ls — посмотреть список образов (ссылка, ссылка)

docker rmi <образ> [образ...] или docker image rm <образ> [образ...] — удалить образ(ы) (ссылка, ссылка)

# Работа с контейнерами

docker run <образ> — поднять контейнер на основе образа (ссылка)

docker run --name <имя> <образ> — при поднятии присвоить имя контейнеру (ссылка)

docker run --rm <образ> — удалять контейнер после завершения его работы (ссылка)

docker run -it <образ> — позволяет «войти» в контейнер во время его создания (ссылка, ссылка)

docker run -d <образ> — поднять контейнер в фоновом режиме (ссылка)

docker ps — список активных (работающих) контейнеров (ссылка)

      docker ps -a — список всех контейнеров (ссылка)

docker stop <контейнер> [контейнер...] — остановить работающий(ие) контейнер(ы) (ссылка)

docker start <контейнер> [контейнер...] — запустить остановленный(ые) контейнер(ы) (ссылка)

docker rm <контейнер> [контейнер...] — удалить контейнер(ы) (ссылка)

docker exec <контейнер> команда — запустить команду в работающем контейнер (ссылка)

docker exec -it <контейнер> bash — запустить bash процесс и «войти» в контейнер (ссылка)
