# Task Tracker: Docker

REST API для управления задачами на базе Spring Boot и PostgreSQL

## Цель

Добавление Docker и Docker Compose.

Стартовое состояние проекта — финальная версия предыдущего этапа.

Предыдущий этап: [task-tracker-03-postgresql](https://github.com/konstantin-bushuev/task-tracker-03-postgresql)

## План

* [x] Создать репозиторий на основе финального состояния task-tracker-03-postgresql
* [x] Настройка Dockerfile и .dockerignore
* [x] Проверить сборку image приложения и запуск отдельного контейнера
* [x] Вынести настройки БД в переменные окружения
* [x] Добавить .env.example и убедиться, что .env исключён из Git
* [x] Добавить PostgreSQL в Docker Compose
* [x] Подключить именованный volume для хранения данных PostgreSQL
* [x] Настроить внутреннюю сеть Compose и взаимодействие приложения с PostgreSQL
* [x] Добавить контейнер Spring Boot приложения в Docker Compose
* [x] Добавить healthcheck PostgreSQL и зависимость приложения от его готовности
* [ ] Проверить запуск всего проекта одной командой и работу REST API.
* [ ] Проверить сохранность данных после остановки и повторного запуска контейнеров.
* [ ] Описать требования, настройку, команды запуска и остановки проекта в README

