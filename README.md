# Meal Picker

Presenting: My solution to the age old question "What is for dinner?". This simple web app allows the user to click on a meal category and recieve a random suggestion for a meal from that category.

v1: completed 26/11/21 - First 2 user stories completed, css needs work, might use bootstrap, tests definately need refactoring, it is annoying to keep reselecting the category when I want a new suggestion so might make the selection persist until it is changed, looking forward to adding new meals via the web-app so I don't have to keep doing it manually in the database.

## Tech Used:

- Ruby
- Sinatra
- Rspec
- Postgres
- CSS
- HTML
- Cabybara

## Screenshots:

## How to Use:

1. Fork and clone this repo
2. `cd` into the folder
3. Set up the database
4. Enter the data/ meals you want
5. Run `bundle`
6. Run `rackup`

## Set up Database:

- Open psql
- Run command `CREATE DATABASE meal_picker;`
- Run command `CREATE DATABASE meal_picker_test;`
#### For each database:
- Run `\c <database name>;`
- Run the queries saved in db/migrations/01_create_meals_tables.sql

## Run Tests:

1. Fork and clone this repo
2. `cd` into the folder
3. Set up the test database
4. Run `bundle`
5. Run `rspec`

## User Stories:

```
As a User
So that I can recieve a random meal suggestion //done//
I want to choose a meal category
```
```
As a User
So that I can decide what to eat //done//
I want to press a button that generates a random meal suggestion
```
```
As a User
So that I can have more meal suggestions
I want to add meal ideas to the database
```
```
As a User
So that I can add meal ideas to the database
I want to access a form to put my new meal in
```
```
As a User
So that I quickly browse all my meal ideas
I want to access a list of all meals in the database
```
```
As a User
So that I can refine my meal suggestions
I want to be able to remove meals I no longer like from the database
```

