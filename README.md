# Task Tracker: Docker

REST API для управления задачами. Приложение построено на Spring Boot и использует PostgreSQL 
в качестве базы данных. 
Приложение и база данных запускаются в Docker-контейнерах с помощью Docker Compose.

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
* [x] Проверить запуск всего проекта одной командой и работу REST API
* [x] Проверить сохранность данных после остановки и повторного запуска контейнеров
* [x] Описать требования, настройку, команды запуска и остановки проекта в README

## Технологии

- Java 21
- Spring Boot
- Spring Data JPA
- PostgreSQL 16
- Docker
- Docker Compose
- Gradle

## Требования

Для запуска проекта необходимы:

- Docker Engine
- Docker Compose v2

Устанавливать Java и PostgreSQL локально не требуется: приложение и база данных запускаются в контейнерах.

## Настройка

1. Клонируйте репозиторий:
2. Создайте файл `.env` на основе примера .env.example
3. При необходимости измените значения переменных в `.env`:

   * POSTGRES_DB=task_tracker
   * POSTGRES_USER=task_tracker
   * POSTGRES_PASSWORD=change_me

   Для реального использования установите собственный пароль.

## Переменные окружения

| Переменная | Назначение |
|---|---|
| `POSTGRES_DB` | Имя базы данных |
| `POSTGRES_USER` | Пользователь PostgreSQL |
| `POSTGRES_PASSWORD` | Пароль PostgreSQL |

Файл `.env` содержит локальные настройки и не должен попадать в Git. Для примера конфигурации используется `.env.example`

## Запуск проекта

Запустите приложение и PostgreSQL одной командой: docker compose up -d --build

Docker Compose:
- соберёт Docker-образ Spring Boot приложения;
- создаст контейнер PostgreSQL;
- создаст постоянный Docker Volume для хранения данных;
- настроит внутреннюю сеть между контейнерами;
- дождётся готовности PostgreSQL перед запуском приложения.

Проверить состояние контейнеров: docker compose ps

PostgreSQL должен иметь статус `healthy`, приложение — `Up`.

## Доступ к приложению

REST API доступен по адресу: http://localhost:8080

PostgreSQL доступен с хост-машины на порту `5433`. 
Внутри Docker Compose приложение подключается к PostgreSQL по адресу `postgres:5432`.

## REST API

Базовый путь: `/api/tasks`

| Метод | Endpoint | Описание |
|---|---|---|
| GET | `/api/tasks` | Получить все задачи |
| GET | `/api/tasks/{id}` | Получить задачу по ID |
| POST | `/api/tasks` | Создать задачу |
| PUT | `/api/tasks/{id}` | Обновить задачу |
| DELETE | `/api/tasks/{id}` | Удалить задачу |
| PATCH | `/api/tasks/{id}/complete` | Завершить задачу |

### Пример создания задачи

```
curl -X POST http://localhost:8080/api/tasks \
  -H "Content-Type: application/json" \
  -d '{
    "title": "New task",
    "description": "Task description"
  }'
```

### Получение списка задач

```
curl http://localhost:8080/api/tasks
```

## Остановка проекта

Остановить и удалить контейнеры и сеть: docker compose down

Данные PostgreSQL при этом сохраняются в Docker Volume.

(Остановка с удалением Docker Volume и всех сохранённых в нём данных (удалит БД): docker compose down -v)

Для повторного запуска: docker compose up -d

## Хранение данных

PostgreSQL использует именованный Docker Volume:

```
volumes:
  postgres_data:
```

Данные сохраняются при остановке и пересоздании контейнеров.


## Полезные команды

Просмотр логов приложения: docker compose logs -f app

Просмотр логов PostgreSQL: docker compose logs -f postgres

Перезапуск приложения: docker compose restart app

Просмотр существующих Docker Volumes: docker volume ls

## Результат

- Spring Boot приложение запускается в Docker-контейнере.
- PostgreSQL запускается в отдельном контейнере.
- Контейнеры взаимодействуют через внутреннюю сеть Docker Compose.
- Запуск всего проекта выполняется одной командой.
- Готовность PostgreSQL проверяется через healthcheck.
- Данные базы сохраняются в именованном Docker Volume.
- REST API доступен на порту 8080.


## Следующий этап

[task-tracker-05-deployment](https://github.com/konstantin-bushuev/task-tracker-05-deployment)
