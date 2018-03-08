# AutoGrader-Induction

#### Developer Notes:

*   In order to run locally on [c9](ide.c9.io) run: <code>rails server -p $PORT -b $IP</code>
*   When adding/changing files to <em>app/assets</em> folder (i.e. css, jpg, js, ect.), make sure you run <code>rake assets:precompile</code> before pushing to heroku, or else it may not work. You may also try adding a new line in <em>config/initializers/assets.rb</em> like <code>Rails.application.config.assets.precompile += %w(signin.css)</code>
*   Theses [Ruby on Rails / Depolying to Heroku videos](https://www.youtube.com/watch?v=nRyUn7D8zCc&list=PLqGj3iMvMa4JiH5mEBG4GNHWdC2u9xdzF) helped a lot getting started, especially parts <b>4 and 5</b>
*   This small [Cucumber Tutorial video](https://www.youtube.com/watch?v=hHqBcBbaRa4) may be useful when making tests
