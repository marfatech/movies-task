## Описание репозитория

Это готовый набор Docker контейнеров на LEMP стеке для выполнения тестового задания с помощью фреймворка Symfony 5.
Для работы над заданием желательно использовать Mac OS, либо любой популярный Linux дистрибутив.

В состав набора входят:

- `nginx 1.17.8`
- `php-fpm 7.4`
- `mysql 8`

Непосредственно в контейнере php-fpm должна вестись работа с фреймворком **Symfony 5**.
Установка и запуск контейнеров используется строго с помощью **командной строки**.

## Установка

1. Клонировать репозиторий.
2. Зайти в корень проекта в командной строке.
3. Запустить команду `docker-compose build` и ожидать успешной сборки Docker образов.
4. Запустить команду `docker-compose up -d` и ожидать успешного запуска Docker контейнеров.
5. Находясь в корне проекта, зайти в PHP контейнер командой <br />`docker exec -it  "symfony-docker_php_1" /bin/bash`
6. Запустить `composer self-update` и дождаться успешного завершения
7. Запустить `composer install` и дождаться успешного завершения
8. Зайти на http://localhost:80 и увидеть приветственную страницу Symfony 5
9. Проверить подключение к Mysql командой<br />
   `bin/console doctrine:query:sql "SHOW TABLES"`<br />
   В случае успеха в консоли должны увидеть:<br />
   `int(0)`, так как на этот момент таблиц Вы еще не создали
   

## Введение

Вам дана задача **реализовать базу фильмов и его участников** с использованием **PHP 7**, **Symfony 5** и **Mysql 8**

В качестве выходного результата Вы должны предоставить методы для работы с этой базой в виде REST API в формате JSON.

Задача реализация структуры базы данных и в каких объектах этой структуры будут храниться данные ложиться на Ваши плечи.

## Описание задачи

**Необходимо реализовать запись, хранение и выдачу базы фильмов и их участников.**

Интерфейсом для обращения к этой базе должны быть методы REST API, формат JSON.

**Фильмы могут иметь жанры:**

- _драма_
- _комедия_
- _боевик_
- _ужасы_
- _мультфильм_

**Участники фильмов могут занимать следующие позиции:**

- _актеры_
- _режиссеры_
- _ассистенты режиссеров_
- _сценаристы_
- _монтажеры_

У каждого объекта хранимого в базе обязательно должен быть уникальный идентификатор,
по которому в API будет осуществляться выдача информации.

**Необходимо реализовать следующий функционал REST API для хранения и выдачи информации:**

- **создание фильма и создание участника фильма**

- **выдача информации о фильме по ID:**
  - _название_
  - _год выпуска_
  - _длительность_
  - _количество участников и их список_

- **выдача информации об участники фильма по ID:**
  - _имя участника_
  - _список фильмов, в которых он участвовал_
  - _жанр фильмов, в котором участвовал этот человек больше всего_

Один и тот же человек может принять участие в нескольких фильмах.

**Удаление, обновление, и сложный поиск делать не нужно**



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
