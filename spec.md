# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Ruby to WebApp with < Sinatra::Base - Used Sinatra DSL
- [x] Use ActiveRecord for storing information in a database - Use Ruby-Active Record Methods to Interact with Database
- [x] Include more than one model class (e.g. User, Post, Category) User Table and Places Table
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)- User has_many Places
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Places belong_to Users
- [x] Include user accounts with unique login attribute (username or email) - 2 validations check for uniq and email format.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - yes
- [x] Ensure that users can't modify content created by other users -accepted login stores email in session hash to validate against all queries/requests
- [x] Include user input validations - email format validation for signup
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
