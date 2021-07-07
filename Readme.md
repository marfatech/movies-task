## Описание репозитория

Это готовый набор Docker контейнеров на LEMP стеке для выполнения тестового задания с помощью фреймворка Symfony 5.
Для работы над заданием желательно использовать Mac OS, либо Ubuntu. Под другие операционные системы работа контейнера не гарантируется.
Для работы в Mac OS рекомендуется использовать ветку `master`
Для работы в Ubuntu рекомендуется использовать ветку `master-ubuntu`

В состав набора входят:

- `nginx 1.17.8`
- `php-fpm 7.4`
- `mysql 8`

Непосредственно в контейнере php-fpm должна вестись работа с фреймворком **Symfony 5**.
Установка и запуск контейнеров используется строго с помощью **командной строки**.

## Установка

1. Клонировать репозиторий.
2. Зайти в корень проекта в командной строке.
3. Для работы в Ubuntu для корректной работы файловой системы в файле `.env` в корне проекта нужно заменить идентификаторы пользователя и группы<br />
`HOST_USER=user`<br />
`HOST_GROUP=user`<br />
`HOST_UID=1000`<br />
`HOST_GID=1000`<br />

на соответствующие Вашему пользователю на хостовой машине. Для получения этих идентификаторов используйте команду `id`

4. Запустить команду `docker-compose build` и ожидать успешной сборки Docker образов.
5. Запустить команду `docker-compose up -d` и ожидать успешного запуска Docker контейнеров.
6. Находясь в корне проекта, зайти в PHP контейнер командой <br />`docker exec -it  "movies_php" /bin/bash`
7. Находясь в корне контейнера `movies_php`, запустить `composer self-update` и дождаться успешного завершения
8. Запустить `composer install` и дождаться успешного завершения
9. Зайти на http://localhost:80 и увидеть приветственную страницу Symfony 5
10. Проверить подключение к Mysql командой<br />
   `bin/console doctrine:query:sql "SHOW TABLES"`<br />
   В случае успеха в консоли должны увидеть:<br />
   `int(0)`, так как на этот момент таблиц Вы еще не создали
   
## Пересборка контейнеров (если нужно)

Находясь в корне проекта запустить последовательно команды<br />
   `sudo rm -rf .database/db`<br />
   `docker kill $(docker ps -q)`<br />
   `docker rm $(docker ps -a -q)`<br />
   `docker system prune`<br />
   `docker-compose build`<br />
   `docker-compose up -d`<br />

## Введение

Вам дана задача **реализовать базу фильмов и его участников** с использованием **PHP 7**, **Symfony 5** и **Mysql 8**

В качестве выходного результата Вы должны предоставить методы для работы с этой базой в виде REST API в формате JSON.

Реализация структуры базы данных и в каких объектах этой структуры будут храниться данные ложиться на Ваши плечи.

## Описание задачи

**Необходимо реализовать запись, хранение и выдачу базы фильмов и их участников.**

Интерфейсом для обращения к этой базе должны быть методы REST API, формат JSON.

У каждого объекта хранимого в базе обязательно должен быть уникальный идентификатор,
по которому в API будет осуществляться выдача информации.

**Реализовать следующий функционал REST API для хранения и выдачи информации:**

- **создание фильма и создание участника фильма**

- **выдача информации о фильме по ID:**
  - _id_
  - _название_
  - _год выпуска_
  - _длительность_
  - _количество участников и их список_
  - _жанр фильма (5 возможных):_
    - _драма_
    - _комедия_
    - _боевик_
    - _ужасы_
    - _мультфильм_

- **выдача информации об участнике фильма по ID:**
  - _id_
  - _имя участника_
  - _список фильмов, в которых он участвовал_
  - _жанр фильмов, в котором участвовал этот человек больше всего_
  - _профессия участника (5 возможных):_
    - _актер_
    - _режиссер_
    - _ассистент режиссера_
    - _сценарист_
    - _монтажер_

Один и тот же человек может принять участие в нескольких фильмах.

## Условия выполнения

Задача должна быть выполнена в виде Github репозитория. Необходимо сделать fork этого репозитория и внести необходимые изменения.
Для проверки задачи предоставить ссылку на получившейся публичный репозиторий, например

`https://github.com/username/movies-task`

-----------

Дедлайна на выполнение задания не ставится, затраченное на выполнение время будет оценено по факту, с учетом качества результата.
Плюсом будет, если исполнитель сможет оценить время на выполнение, перед его началом.

Задание поставлено в абстрактном виде, то есть конкретно не указано, как должны называться таблицы, поля и методы, исполнителю
нужно сделать этот выбор самому.

При приеме задания будет оцениваться работоспособность методов, структура базы, код, принятые разработчиком решения.

Оценка задачи будет выполняться по следующим приоритетам в порядке убывания:

1. Будет оцениваться функциональность API методов - в первую очередь они должны выполнять задачу, описанную в задании. 
   Без выполнения этого пункта результат задания будет сразу отклонен.
2. Реализация БД и запросов к ней, реализация API методов.
3. Чистота кода и использование современных практик программирования
4. Продуманность методов и какие условия учел разработчик при их разработке.

Исполнитель имеет возможность дополнить условия задачи или дополнить функционал API, по своему усмотрению,
если объяснит принятое решение.

Так же плюсом будет, если исполнитель опишет трудности, возникшие при выполнении задания, объяснит принятые решения 
и предложит другие варианты решения задачи.
