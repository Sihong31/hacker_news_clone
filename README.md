# hacker_news_clone
a clone of hacker news on rails

#practice heroku deploy

This is very well documented at https://devcenter.heroku.com/articles/getting-started-with-rails4

Short version:
Download heroku tool belt and install it. Then in terminal, cd into the root folder of the app you want to deploy

In the Gemfile declare ruby version with a line like:
ruby "2.1.4"

Also add 
gem 'rails_12factor', group: :production

do bundle install and check the changes into git.

Then, still in terminal in the app folder do

heroku login  #this logs you into heroku
heroku create  #this creates your app and creates a ‘heroku’ remote in your git setup
git push heroku master #this deploys your app. 
heroku run rake db:migrate #this will set up your database
heroku open #this will open your default browser on the root page of your app.

Once it’s deployed:

heroku apps:rename "your desired name", 

heroku logs --tail
to watch your logs. Leave off the —tail to get a snapshot instead

heroku run rails console
will log you into your rails console

To deploy a new version:
git push heroku master 
again

To delete an app you don’t want any more
heroku apps:destroy app-name #where app-name is the name heroku gave your app
