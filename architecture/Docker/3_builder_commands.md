Инструкции Dockerfile'а
В этом уроке мы рассмотрим лишь часть инструкций, достаточную для создания собственных образов.

FROM — задаем базовый образ, на основе которого собираем новый (ссылка) https://docs.docker.com/engine/reference/builder/#from

COPY — копируем файл с нашей файловой системы в файловую систему контейнеров (ссылка) https://docs.docker.com/engine/reference/builder/#copy

ADD — добавляем файл или ссылку с нашей файловой системы в образ (ссылка) https://docs.docker.com/engine/reference/builder/#add

RUN — выполняем команду (ссылка) https://docs.docker.com/engine/reference/builder/#run

WORKDIR — устанавливаем рабочую директорию (ссылка) https://docs.docker.com/engine/reference/builder/#workdir

ENTRYPOINT — задаем точку входа для запуска контейнера (ссылка) https://docs.docker.com/engine/reference/builder/#entrypoint

CMD — задаем точку входа для запуска контейнера (ссылка) https://docs.docker.com/engine/reference/builder/#cmd

В 4-м уроке узнаем про существование инструкции VOLUME.

В 5-м уроке мы познакомимся с инструкциями EXPOSE и ENV.

В 7-м уроке узнаем еще про одно применение инструкции COPY.

За рамками курса останется еще одна интересная инструкция — HEALTHCHECK. Однако примерно это мы увидим в 9-м уроке, когда прикоснемся к docker-compose.

Со списком инструкций можно ознакомиться в документации (ссылка).

# Разница в использовании ENTRYPOINT и CMD

Несмотря на то, что и ENTRYPOINT, и CMD отвечают за запуск программы в контейнере, они используются в разных ситуациях. Особенно это касается случая, когда в одном докерфайле используются обе инструкции одновременно.

Предлагаем ознакомиться с этим абзацем из документации — ссылка. https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact

Также полезно будет заглянуть сюда. https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile

```
No ENTRYPOINT	ENTRYPOINT exec_entry p1_entry	ENTRYPOINT [“exec_entry”, “p1_entry”]
No CMD	error, not allowed 	/bin/sh -c exec_entry p1_entry 	exec_entry p1_entry
CMD [“exec_cmd”, “p1_cmd”]	exec_cmd p1_cmd 	/bin/sh -c exec_entry p1_entry 	exec_entry p1_entry exec_cmd p1_cmd
CMD [“p1_cmd”, “p2_cmd”]	p1_cmd p2_cmd 	/bin/sh -c exec_entry p1_entry 	exec_entry p1_entry p1_cmd p2_cmd
CMD exec_cmd p1_cmd	/bin/sh -c exec_cmd p1_cmd	/bin/sh -c exec_entry p1_entry 	exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd
```

# Разница в использовании ADD и COPY

Полезно будет заглянуть сюда https://www.geeksforgeeks.org/difference-between-the-copy-and-add-commands-in-a-dockerfile/ и сюда https://stackoverflow.com/questions/24958140/what-is-the-difference-between-the-copy-and-add-commands-in-a-dockerfile.

Ну и, безусловно, в документацию (COPY https://docs.docker.com/engine/reference/builder/#copy, ADD https://docs.docker.com/engine/reference/builder/#add).

Рассмотрим разницу в использовании на двух примерах — добавление архива и файла по ссылке.

При использовании ADD архив распаковался, а файл (в данном случае docker-compose.yaml) по ссылке скачался.

При использовании COPY файл по ссылке скачивать нельзя, поэтому упали с ошибкой. При этом архив не распаковался.

# Команда для сборки

docker build <путь, где лежит Dockerfile> — создать образ на основе Dockerfile (ссылка)

docker build -t <имя_образа:тег> <путь> — создать образ с именем и тегом (ссылка)

# Собственные образы на Docker Hub

Регистрация на Docker Hub
Для начала заходим на сам сайт Docker Hub (https://hub.docker.com/).
Нажимаем кнопку Register.
Там нужно ввести 3 значения — Docker ID, Email и Password.

- Docker ID — можно назвать логином. Он будет составлять часть названия образа (см.ниже)
  Нажимаете галочки, затем Sign Up.
  На почту придет уведомление. Нужно подтвердить ваш адрес.
  Заходите на Docker Hub под созданным пользователем.
  Создание своего репозитория
  После того, как вы зарегистрировались, необходимо создать репозиторий (прямо как на GitHub).

На странице вы увидите плашку Create a Repository. Нажмите на неё.

После нажатия вы попадете на страницу создания репозитория. Создайте там свой репозиторий.

Отлично! Теперь у вас есть свой репозиторий, где можно хранить свои образы.

Команды для работы с репозиторием
После того, как у вас появился репозиторий, попробуйте загрузить в него свой образ.

Чтобы это сделать, необходимо локально авторизоваться, при необходимости сменить имя и тег образа и сделать пуш на Docker Hub.

Для локальной авторизации используется команда docker login.
В таком случае у вас попросит username (как раз Docker ID) и пароль.
Чтобы сменить название образа и тег, нужно воспользоваться командой
docker tag <исходный*образ> <результирующий*образ>.
В названии результирующего образа будет присутствовать ваш username, слеш (/), название репозитория.
Чтобы отправить образ на Docker Hub, нужно ввести команду docker push <образ>
Чтобы локально разлогиниться, нужно ввести команду docker logout.

Выглядеть это будет как-то так:

После того, как вы загрузили образ на Docker Hub, вы можете его скачать.

Как вы уже знаете, делается это командой docker pull :)
