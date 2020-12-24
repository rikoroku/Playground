# README

## How to start
### 1. Create .env file

```bash
$ cp .env.sample .env
```

### 2. Build and run
You only have to do the following command.
And then, you can see the app screen by inputting `http://localhost:3000` on the browser.

```bash
$ docker-compose up -d
```

## Commands
Following commands are to help develop.

RuboCop - Ruby linter and code formatter.

```bash
$ docker-compose exec app bundle exec rubocop
```

Brakeman - A Static analysis tool to check Ruby on Rails applications for security vulnerabilities.

```bash
$ docker-compose exec app bundle exec brakeman
```
