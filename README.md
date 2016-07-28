# Fraisdujardin.top or homegrown.top

This project is build out of the need to build an application to streamline and in a way automate the selling of extra vegetables in my garden to neighbours, friends and collegues.

The basis of this application is the [e-commerce tutorial][2] by [envatotuts+][1]
I adapted this code to my specific needs, if you are interested you can find the original code in their [github project][3]

Version 1:
--------
	- Build database with available vegetables, easy to update only by me
	- Reservation system for later pickup by client and preparation by me
	- Dynamic updating of the available items when reservation is completed
Version 2:
--------
	- Add payment system through paypal and/or bitcoin
Version 3:
--------
	- Let other producers add their products
Version 4:
--------
	- Order by facebook / slack / signal messenger bot
Version 5:
--------
	- couple the site to an IoT locker in the garden to pick up items
Version 6:
----------
	- Let users vote what to plant in certain beds

[1]: http://www.tutsplus.com
[2]: https://code.tutsplus.com/courses/build-a-store-with-a-payment-gateway-in-rails/lessons/bootstrap-our-rails-application
[3]: https://github.com/tutsplus/rails_store_with_braintree/blob/master/app/assets/stylesheets/application.css


# Installation on Heroku:

I'm deploying through github master, which will always update the codebase to the newest accepted in master update.
I've also installed the sendgrid add-on on Heroku, to be able to send mails.
I've also installed the postgress add-on to be able to use the database on Heroku.


All my variables are set in config variables in my production enviroment and are set in Heroku manually.

You can find the config variables under settings/reveal config variables:

## Config variables used:


```
DROPBOX_ACCESS_TOKEN
DROPBOX_ACCESS_TOKEN_SECRET
DROPBOX_APP_KEY
DROPBOX_APP_SECRET
DROPBOX_USER_ID
SMTP_USERNAME
SMTP_PASSWORD
SMTP_SERVER_ADDR
```

## Config for sendgrid:


install the add-on on Heroku for Sendgrid, configure your account and fill in these config variables:

```
SMTP_USERNAME: sendgrid_username
SMTP_PASSWORD: sendgrid_password
SMTP_SERVER_ADDR: smtp.sendgrid.net
```

## Config for dropbox:

As Heroku does not allow uploads to their servers and remove files either after a new deploy or a fixed time period (atm 24h), I've chosen to use dropbox integration with the gem [carrierwave-dropbox][4]

Most part of the setup is done, however, you still need to do the following to make it work for you:

Make a [dropbox][5] account or login to your account and go to [create dropbox app][6].

1. Choose Dropbox api
2. Choose App folder
3. Give your app a name

After confirming, you don't need to change any other options, just click on show app secret.

Install the [heroku-toolbelt][7] and in your terminal do following command:

    heroku run - a YOUR HEROKU APP NAME rake dropbox:authorize APP_KEY=YOUR DROPBOX APP KEY APP_SECRET=YOUR DROPBOX APP SECRET ACCESS_TYPE=app_folder

replace the YOUR XXX with your credentials.

follow the instructions on screen and you get a response like this:

```
access_token: your dropbox access token
access_token_secret: your dropbox acces token secret
user_id: your dropbox user id
```
Now for the last part, update the config variables in the Heroku settings:

```
DROPBOX_ACCESS_TOKEN: your dropbox access token
DROPBOX_ACCESS_TOKEN_SECRET: your dropbox access token secret
DROPBOX_APP_KEY: your dropbox app key
DROPBOX_APP_SECRET: your dropbox app secret
DROPBOX_USER_ID: your dropbox user id
```

## Config for admin user:

register a user, go to the heroku console by running:

```
heroku run -a YOUR HEROKU APP NAME console
```

with till you see:
```
[irb(main)]:001.0>
```

now type: 

```
user = User.first
user.update_attributes(:admin => true, :id => '1')
```



<!-- ---------- Future ref -------------

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	2.1.3
* System dependencies

Install Image magick when on Mac:
	brew install graphicsmagick

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->
 [4]: https://github.com/robin850/carrierwave-dropbox
 [5]: https://db.tt/ws8Z4SV8
 [6]: https://www.dropbox.com/developers/apps
 [7]: https://toolbelt.heroku.com/
