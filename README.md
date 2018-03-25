# AutoGrader-Induction

#### Developer Notes:

*   In order to run locally on [c9](https://c9.io/login) run: <code>rails server -p $PORT -b $IP</code>
*   When adding/changing files to <em>app/assets</em> folder (i.e. css, jpg, js, ect.), make sure you run <code>rake assets:precompile</code> before pushing to heroku, or else it may not work. You may also try adding a new line in <em>config/initializers/assets.rb</em> like <code>Rails.application.config.assets.precompile += %w(signin.css)</code>
*   Theses [Ruby on Rails / Depolying to Heroku videos](https://www.youtube.com/watch?v=nRyUn7D8zCc&list=PLqGj3iMvMa4JiH5mEBG4GNHWdC2u9xdzF) helped a lot getting started, especially parts <b>4 and 5</b>
*   This small [Cucumber Tutorial video](https://www.youtube.com/watch?v=hHqBcBbaRa4) may be useful when making tests
*   This site has a list of new updates for Cucumber 3.0 vs 2.0 (http://drnicwilliams.com/2009/04/15/cucumber-building-a-better-world-object/)
*   Helpful rspec sites are, for writing new tests (https://semaphoreci.com/community/tutorials/getting-started-with-rspec), for setting   up framework which is already done(https://relishapp.com/rspec/rspec-rails/docs/gettingstarted). To run rspec tests use "rake spec" 
*   For user authentication, These 2 videos go over [Devise](https://www.youtube.com/watch?v=zJYuLebl-Js) and and how to set it up for [Omniauth](https://www.youtube.com/watch?v=8DdlW-lzowA). Since we are wanting to login with @tamu.edu emails, which uses Gmail, we will be using the omniauth gem [omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2). The first half of this [article](https://richonrails.com/articles/google-authentication-in-ruby-on-rails/) shows how to setup a site to use Google+ API (i.e. Gmail).
*   To reset and empty the local database, use <code>rake db:drop db:create db:migrate</code>
