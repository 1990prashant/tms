# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["admin", "developer"].each do |role|
  Role.find_or_create_by(name: role)
end

user = User.find_or_initialize_by(email: "admin@tms.com")
if user.new_record?
  user.roles.new(name: "admin")
  user.first_name = "Project"
  user.last_name = "Manager"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.save
end
