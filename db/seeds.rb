# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Factory.create({:phone => "123-456-7890",  :description => "cotton knits cut & sew", 
  :location => "Los Angeles, CA", :name => "Savvy Apparel Studio"})
Factory.create({:phone => "234-567-8901",  :description => "demim wash", 
    :location => "Los Angeles, CA", :name => "Blue River Denim"})
Factory.create({:phone => "345-678-9012",  :description => "wool sweaters", 
      :location => "San Francisco, CA", :name => "Wooly"})
Factory.create({:phone => "456-789-0123",  :description => "swimwear", 
        :location => "Brooklyn, NY", :name => "Sew and Stretch"})

User.create({:username => "guest", :password => "password"}) #has two favorites
User.create({:username => "almond", :password => "iloveyoualmond"}) #has two favorites
User.create({:username => "walnut", :password => "iloveyouwalnut"}) #has no favorites

Favorite.create({ :user_id => 1, :factory_id => 1})
Favorite.create({ :user_id => 1, :factory_id => 2})

Favorite.create({ :user_id => 2, :factory_id => 3})
Favorite.create({ :user_id => 2, :factory_id => 4})

Note.create({ :factory_id => 1, :user_id => 3, :content => "note 1"})
Note.create({ :factory_id => 2, :user_id => 3, :content => "note 2"})
Note.create({ :factory_id => 3, :user_id => 3, :content => "note 3"})

