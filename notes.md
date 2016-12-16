1. Create project `rails _4.2.7_ new wiki`
2. Check `bin/rails s`
3. Get Gems to be used: Haml, Bootstrap-sass, devise, simple_form
  a. restart server
4. Generate model for articles `bin/rails g model Article title:string content:text`
  a. Check model and db migration created
  b. `bin/rake db:create db migrate`
5. Generate controller `bin/rails g controller Articles`
  a. Check files in controller
6. In Articles controller
  a. Define index controller, no implementation
  b. create view `index.html.haml` write something
  c. Create route and set to root in config/routes.rb to `root article#index`
  d. restart server, and view '/'
7. Create new article
  a. Create 'create'  and 'new' controller, private method for params for form in articles controller
  b. Add routes for these, in array
  c. Create views for new and a partial for the form
