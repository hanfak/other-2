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
7. Create new article and show article
  a. Create 'create'  and 'new' controller, private method for params for form in articles controller
  b. Add routes for these, in array
  c. Create views for new and a partial for the form
    1. In form create form wiht fields for model
  d. go to simple_form repo and follow instruction for bootstrap-sass `bin/rails generate simple_form:install --bootstrap`
  e. Add Bootstrap to assets, 'app/assests/stylesheets/application.css', also add extension 'scss' to file. Look at repo bootstrap-sass
  f. Add show to controller and associated route
  g. Create show view, and add html
8. Show all articles
  a. create loop to go through all articles in index view
  b. in index controller access all articles
9. User authentication
  a. setup devise, goto devise repo
  b. Follow instructions on terminal
  c. create model and migrate (follow instructions on repo)
  d. Add sign in, sign up, sign out to views
10. Add association to user and articles
  a. In models for both add association types
  b. create migration to link tables `bin/rails g migration add_user_id_to_articles user_id:integer:index` and check in migration folder
  c. rake migrate
  d. Change article controller, to add user
11. Authenticate user for creating new article
  a. Add authenticate_user to article controller
  b. Remove new article if not signed in
12. Add Categories
  a. 'bin/rails g model Category name:string' and migrate
  b. 'bin/rails g migration add_category_id_to_articles category_id:integer' and migrate
  c. Add Assocaition to arcitle
    1. Do in each model
  d. Create category records in terminal
  e. Change form
    - `= f.collection_select :category_id, Category.all, :id, :name, { promt: "Choose a Category" }`
    -   `= f.collection_check_boxes :category_id, Category.all, :id, :name, { prompt: "Choose a Category" }`
      - For check boxes when more than one category for a wiki
  f. Article contrl add permit for categories
  g. layout, add list of category, view categories
    1. view commit 'list categories on index'
    2. Change controllers, to access query params and show post by categories
  
