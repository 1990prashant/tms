# README

# Step to setup locally

* Required ruby version - 2.6.3

* bundle install

* rake db:create

* rake db:migrate

* rake db:seed //This will create an admin user and roles into the system

* rails s

Admin user can only create a project can add developer by clicking on **Add Developer** button on the **Projects** can create todos by clicking on **Add Todo** button on the same page after that they can assign that todos to the developer by clicking on **Assign Todos** button on the same page. Admin user can edit and delete the projects/todos.

Developer can see the assigned todos and can change their states.

You can visit https://tms-prashant.herokuapp.com/ for the demo
