# _uBudget_

#### _Expense Tracking/Logging Application, 1.0.0, 03/09/17_

#### By _Jacob Hixon_

## Description

A web application that allows a user to keep track of spending, and utilizes charts to display data about the user's spending habits. This application will also allow a user to setup spending limit goals, sort transactions by category, and view historical graphs of transactions between any given date.

### Demo

_A live demo can be found [here](https://serene-thicket-27027.herokuapp.com/)_

## Setup/Installation Requirements

1. _Clone into repository located at https://github.com/jacobhixon47/ubudget.git ._
2. _In the terminal, make sure you are inside of the project folder, then type the following commands:_
  * `$ bundle install`
  * `$ rake db:create`
  * `$ rake db:migrate` _(Note: if this command returns an error, run `$ bundle exec rake db:migrate` instead_
  * `$ rails server`
3. _visit localhost:3000 in your browser_
4. _Optionally, you can seed the database after creating a user account (or several!) by running_ `$ rake db:seed`
  * _this will create 810 transactions per user, with 750 transactions between $0-30, 50 transactions between $30-100, and 10 transactions between $100-750._


## Technologies Used

* _Ruby on Rails_
* _ActiveRecord_
* _PostgreSQL_
* _Devise_
* _ChartKick_
* _GroupDate_

### License

This file is part of (uBudget).

    (uBudget) is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    (uBudget) is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the (uBudget). If not, see <http://www.gnu.org/licenses/>.

Copyright (c) 2017 **_Jacob Hixon_**
