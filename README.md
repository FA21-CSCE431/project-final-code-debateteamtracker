# DebateTeamTracker Readme

## Introduction ##

The TAMU Speech & Debate Team web app acts as a tool to increase engagement
and participation of members within the organization by giving members the ability
to see their participation and points within the organization. In addition, it
provides an intro to the organization, and increases communication about the organizations
functions to members and potential members by showing upcoming events

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/haqq97/DebateTeamTracker`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd DebateTeamTracker`

  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##


#### The following variables can be found within the heroku config variables ####
|     Google OAuth Variables 	|
|        :--------:          	|
|   `GOOGLE_OAUTH_CLIENT_ID` 	|
|  `GOOGLE_OAUTH_CLIENT_SECRET` |

These variables are needed in order for the application's login through Gmail to operate. For local development see the development.rb file for how these can be configured.

For more info regarding config variables and adding them on heroku: https://devcenter.heroku.com/articles/config-vars

## Deployment ##

To deploy to Heroku, push the changes to the GitHub repository

Add changes and commit
`git add *`
`git commit -m “your commit message”`
`git push https://github.com/haqq97/DebateTeamTracker yourbranch` 

## CI/CD ##

Heroku handles CI/CD, automatically building changes to the repository on the linked debate-team-stage-app.

For additional info on deploying to heroku using git: https://devcenter.heroku.com/articles/git#for-an-existing-heroku-app 

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.
