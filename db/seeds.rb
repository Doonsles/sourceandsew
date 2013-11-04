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
        :location => "Brooklyn, NY", :name => "sew and stretch"})

User.create({:username => "guest"})