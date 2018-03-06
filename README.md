# AutoGrader-Induction

#### Developer Notes:

*   In order to run locally on [c9](ide.c9.io) run: <code>rails server -p $PORT -b $IP</code>
*   When adding new files to <em>app/assets</em> folder (i.e. css, jpg, js, ect.), make sure you run <code>rake assets:precompile</code> before pushing to heroku, or else it may not work. You may also try adding a new line in <em>config/initializers/assets.rb</em> like <code>Rails.application.config.assets.precompile += %w(signin.css)</code>


