# Relational Rails
### About

Relational Rails is a rails app using two one to many relationships built in 10 days, that allow users to CRUD resources. This repo serves as an introduction to building simple Rails apps. It was assigned as a project for Module 2 of the Backend Development program for the Turing School of Software and Design.

1. Start the server- `rails s`
2. [👀 Visit the app on Localhost:3000](http://localhost:3000/)

100% test coverge!

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Seed the database: `rails db:seed`

### Database Design
<img width="400" alt="database schema diagram" src="/download.png">

## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [orderly](https://github.com/jmondo/orderly)
* [launchy](https://github.com/copiousfreetime/launchy)

## Testing
* RSpec and Capybara were used for unit and integration testing and project development adhered to TDD principles.
* WebMock was used to stub out API requests and actual requests are blocked from the test environment.
* Simplecov was used to track total test coverage.
* To run our test suite, RSpec, enter `$ bundle exec rspec` in the terminal.
* To see a coverage report enter `$ open coverage/index.html`
* SimpleCov test coverage is at 100.00%:

<img width="1399" alt="Relational Rails Coverage Report" src="https://user-images.githubusercontent.com/77904287/130531547-1b54aa71-541a-4cbc-a98e-b1ca40f4c0f6.png">


## Versions

- Ruby 2.7.2

- Rails 5.2.5

## Authors

- Sidarth Bagawandoss - [sidarth20](https://github.com/Sidarth20)
- Emmy Morris - [emmymorris](https://github.com/EmmyMorris)
