# URL Shortener

A simple web app to abbreviate the URLs and link similar domain URLs into single short form.

## Problem Statement
Build a url shortener service using Ruby on Rails.

### Requirements

- Create a RESTful application for
  - Creating a shortened url
  - Fetching list of shortened urls
  - Fetching original url from a shortened url
  - Deleting shortened-urls

- Constraints for the shortener service
  - Shortened urls should be unique for different urls.
  - Shortener service should always generate the same url for a given input
  - Shortener service should generate the same url for all of below cases
    - google.com
    - www.google.com
    - http://google.com
    - http://www.google.com
    - https://google.com
    - https://www.google.com

- Build a simple form UI for shortening urls
- Show a list of all shortened urls
- Users should be able to navigate to the original url by clicking on the shortened url
- Write appropriate test cases for the shortener service

- Bonus
  - Support uploading '.csv' file containing urls and show the shortened urls for each

## Technical Details
- Using
```
ruby '2.5.0'
gem 'rails', '~> 5.2.1'
gem 'sqlite3', '1.3.13'                   # Used as a Database
gem 'bootstrap', '4.1.3'                  # Used for having a responsive UI components
gem 'jquery-rails', '4.3.3'               # Used for jQuery support
gem 'kaminari', '1.1.1'                   # Used for pagination
gem 'bootstrap4-kaminari-views', '1.0.0'  # Used for pagination theme
gem 'rspec-rails', '3.7.2'                # Used for UAT test cases
gem 'faker', '1.9.1'                      # Used for generating fake data for test cases
```
- Using `rbenv` as the Ruby Version Management tool.
- Using `font-awesome` minified css stylesheet for icons in the app.

## Implementation Details
- Edit/Update option is blocked for existing records
- Usng Bootstrap theme for look and feel
- Using CSS for DOM element styling
- Using Bootstrap4 Kaminari for pagination
- Required `db:seed` is added.
- Rspec feature tests are added for UAT.

## Steps to setup and run the project on Ubuntu
- Clone the repository using [`git clone`](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository) command.
```
git clone https://github.com/manjunath724/URL-Shortener
```
- CD into the repository and run 
```
bundle install
``` 
- Create database and run the migrations
```
rake db:create db:migrate db:seed             # Seed to feed sample data
```
- Start the server
```
rails server
```
- visit `localhost:3000` in your browser.
- Add new URL for shortener service
- Remove an existing record
- Navigate through records using pagination
- Redirect to original URL through abbreviated URL

### Steps to run Rspec tests
  1. Drop existing test db to start with a fresh migration and data
  ```
    RAILS_ENV=test rake db:drop       # Sometimes db:environment:set may have to be passed if prompted
  ```
  
  2. Create, migrate and seed data
  ```
    RAILS_ENV=test rake db:create db:migrate db:seed
  ```
  
  3. Execute `Rspec` using the below command
  ```
    rspec spec/
  ```
  4. For formatted output like documentation type
  ```
    rspec spec/ --format documentation
  ```
<hr>
