# README

This repo is based on [howtographql](https://www.howtographql.com/graphql-ruby/0-introduction/).

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

## How to try
Visit `http://localhost:3000/graphiql` and put some GraphQL queries.

## Commands
Following commands are to help develop.

RuboCop - Ruby linter and code formatter.

```bash
$ docker-compose exec app bundle exec rubocop
```

Brakeman - Static analysis tool to check Ruby on Rails applications for security vulnerabilities.

```bash
$ docker-compose exec app bundle exec brakeman
```

RSpec - Testing tool.

```bash
$ docker-compose exec -e "RAILS_ENV=test" app bundle exec rspec
```
