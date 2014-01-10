## Quotes Application

* Ruby  v 2.1.0
* Rails v 4.0.2

### Demo

Check: http://quotes-application.herokuapp.com

### Installation manual

* `git clone https://github.com/Lieke22/Quotes.git` 
* In `app/controllers/quotes_controller.rb`: add your Flickr API keys on line 98 and 99. You can apply for your API keys [here] (http://www.flickr.com/services/apps/create/apply).
* Before running the application you have to install the gems from the gemfile. To do this type in your command line `bundle install` (Note: if you can't get the gem pg installed: you have to install libdev -->  `apt-get install libpq-dev`.In case you get an error about javascipt runtime, please install node.js --> `apt-get install nodejs`)
* To start the application type `rails server` and then go to http://0.0.0.0:3000. The page will refresh every 10 seconds.

### Enable Automatic input
* When you start the application, the database will be empty. The cron job is schedulded to add a quote every 2 minutes. To enable the cronjob type `whenever -i`. You can check the crontab with `crontab -l`. The entry should be similar to this:

 > \# Begin Whenever generated tasks for: ~/quotes/config/schedule.rb
 > 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58 * * * * /bin/bash -l -c 'cd ~/quotes && RAILS_ENV=development bundle exec rake quotes:fetch --silent'


* If you'd like to try it out without the cronjobs you can load the fixtures quotes.yml. Use: `rake db:fixtures:load RAILS_ENV=development`, this will add four quotes to your database.


### How does it work?
A Ruby-on-Rails application that displays random quotes. The application consists of a couple of components & plugins:

* `Admin`
* `Flickr API`
* `IheartQuotes API`
* `Cronjob`
* `Sqlite3`
* `Semantic UI`
* `Whenever`
* `flickraw`
* `jquery-rails`
* `will-paginate`


The homepage displays random quotes (using the Iheartquotes API) and displays a fullscreen image (using the Flickr API). It automatically refreshes every 10 seconds.

### Admin
The admin page shows the collected quotes. You can sort the quotes ascending by author or quote. There's also an image url column that displays the Flickr url of the image.

At the admin page, which you can acces using 'admin' and password 'secret', you can edit/show and delete quotes. You can also add a new quote to the database or return to the homepage.

### Significant word and Flickr API
Most of the time, the longest word in a quote turns out to be the most important.The most significant word method returns the longest word from a quote. The result of this method is used in the Flickr.Search.Photo API as keyword. The Flickr API is looking for images in the 'commons' category (I liked those pictures better) and returns the required image with the largest image size.

Note: On the home page, the most significant word is highlighted.

Sometimes Flickr can't find a picture for the assigned keyword. When this happens, the homepage will display an image with a subtle error code.

If you want to use the Flickr API, you have to add your own Flickr API keys.

### Cronjob
To store quotes in the database I used the Iheartquotes API and created a task to fetch (and save) a quote once per 2 minutes. I used the whenever gem to do this more easily.

Validations: the quote has to be unique and must have a maximum_length of 300 characters (otherwise there will be too much text displayed).


### Fixtures
The fixtures load a small set of data used for testing the application. To load the fixtures. Use: `rake db:fixtures:load RAILS_ENV=development`

###Screenshots Pages

Front page

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Home.jpg)

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/fullscreen.png)


Admin page

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Admin.png)


Show

This page shows the quote, including author, text, image link and a small thumbnail of the image.

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Show.png)


Edit

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Edit.png)


New

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/New.png)

### Have questions?

I'd be happy to help. Contact me on Twitter, [@lieke2208](https://twitter.com/lieke2208)
