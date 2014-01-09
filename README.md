Quotes Application

Ruby  v 2.1.0
Rails v 4.0.2

### Installation manual

 - Download the app.
 - In app/quotes/quotes_controller.rb: add your Flickr API keys on lign 98 and 99. You can apply for your API keys [here] (http://www.flickr.com/services/apps/create/apply).
 - When you start the application, the database will be empty. (the cron job is schedulded to add a quote every 2 minutes.) If you'd like to try it out and don't want to wait you can load the fixtures quotes.yml. Use: rake db:fixtures:load RAILS_ENV=development, this will add four quotes to your database.


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


The homepage displays random quotes (using the Iheartquotes API) and displays an image (using the Flickr API). It automatically refreshes every 10 seconds.

### Admin
The admin page shows the collected quotes. You can sort the quotes ASC by author or text. There's also a image url column that displays the Flickr url of the image.

At the admin page, you can edit/show and destroy quotes. You can also add a new quote to the database or return to the homepage.


### Significant word and Flickr API
Most of the time, the longest word in a quote turns out to be the most important.The most significant word method returns the longest word from a quote. This method is used in the Flickr.Search.Photo API as keyword. The Flickr API is looking for images in the 'commons' category (I liked those pictures better) and returns the required image with the largest image size.

Note: On the home page, the most significant word is highlighted.

Sometimes Flickr can't find a picture with the assigned keyword. When this happends, the home page will display an image with a subtle error code.

If you want to use the Flickr API, you have to add your own Flickr API keys.

### Cronjob
To store quotes in the database I used the Iheartquotes API and generated a task to fetch (and save) new a quote once per 2 minutes. I used the whenever gem to do this more easily.

Validations: the quote has to be unique and a maximum_length of 300 words. (Otherwise there will be to much text displayed)



### Fixtures
The fixtures load a small set of data used for testing the application. To load the fixtures. Use: rake db:fixtures:load RAILS_ENV=development

###Screenshots Pages

Front page

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Home.jpg)

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Fullscreen.jpg)

Admin page

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/admin.jpg)


Show

This page shows the quote, including author, text, image link and a small thumbnail of the image.

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Show.jpg)


Edit

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/edit.jpg)


New

![screenshot1](https://raw2.github.com/Lieke22/Quotes/master/app/assets/images/Screenshot%20from%202014-01-08%2012:46:36.png)

### Have questions?

I'd be happy to help. Contact me on Twitter, [@lieke2208](https://twitter.com/lieke2208)