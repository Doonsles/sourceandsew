require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

f1 = Factory.create({:phone => "123-456-7890",  :description => "We manufacture apparel for the world's leading brands.", 
  :location => "Seattle, WA", :name => "Tamoda Apparel"})
f1.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/scissors.png")
f1.save!

f2 = Factory.create({:phone => "234-567-8901",  :description => "Bringing color to life...with an attitude", 
    :location => "Commerce, CA", :name => "Cotton Heritage"})
f2.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/sewing-machine-thread.png")
f2.save!    
    
f3 = Factory.create({:phone => "345-678-9012",  :description => "Cut & Sew | Embroidery", 
      :location => "Linden, NJ", :name => "Stylus Apparel"})
f3.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/man-ironing.png")
f3.save!

f4 = Factory.create({:phone => "456-789-0123",  :description => "We make t-shirts AWESOME!", 
        :location => "San Marcos, CA", :name => "Lifework"})
f4.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-3.png")
f4.save!

f5 = Factory.create({:phone => "456-789-0123",  :description => "America wears Jensen", 
        :location => "Portsmouth, VA", :name => "Jensen Apparel"})
f5.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-8.png")
f5.save!


f8 = Factory.create({:phone => "789-012-3456",  :description => "Quality. Guaranteed.", 
        :location => "East Providence, RI", :name => "Turfer"})
f8.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-4.png")
f8.save!

f9 = Factory.create({:phone => "890-123-4567",  :description => "New York City-based apparel manufacturer.", 
        :location => "New York, NY", :name => "Emma New York"})
f9.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-2.png")
f9.save!

f10 = Factory.create({:phone => "901-234-567",  :description => "samples, sourcing, and production starting at 100 units", 
        :location => "San Francisco, CA", :name => "S.J. Private Label"})
f10.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-11.png")
f10.save!

f11 = Factory.create({:phone => "123-456-7890",  :description => "A Premier Manufacturer and Merchandiser of Quality since 1931.", 
        :location => "New York, NY", :name => "PICO Manufacturing"})
f11.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-10.png")
f11.save!

f12 = Factory.create({:phone => "234-567-8901",  :description => "Providing the finest woven goods and finishing services for over 60 years.", 
        :location => "Burlington, NC", :name => "Copland Industries"})
f12.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-9.png")
f12.save!

f13 = Factory.create({:phone => "345-678-9012",  :description => "Designing and manufacturing fabrics for four generations.", 
        :location => "New Rochelle, NY", :name => "Ascher Studio Inc."})
f13.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-8.png")
f13.save!

f14 = Factory.create({:phone => "456-789-0123",  :description => "Irish Linen", 
        :location => "Mineola, NY", :name => "Ulster Weavers/ Moygashel"})
f14.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-7.png")
f14.save!

f15 = Factory.create({:phone => "567-890-1234",  :description => "Manufacturer of specialty knits, wovens and jacquards!", 
        :location => "Haw River, NC", :name => "Interstate Narrow Fabrics"})
f15.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-4.png")
f15.save!

f16 = Factory.create({:phone => "678-901-2345",  :description => "Immediates, Textile Short-Run Production", 
        :location => "Raleigh, NC", :name => "Li Sashay"})
f16.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-3.png")
f16.save!

f7 = Factory.create({:phone => "678-901-2345",  :description => "Divine Apparel, Inc.", 
        :location => "New York, NY", :name => "Divine Apparel, Inc."})
f7.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-6.png")
f7.save!

f17 = Factory.create({:phone => "789-012-3456",  :description => "Providing over 75 years of quality to the OTC industry.", 
        :location => "Browns Summit, NC", :name => "Logantex"})
f17.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-2.png")
f17.save!

f18 = Factory.create({:phone => "890-123-4567",  :description => "Manufactures some of America's finest textiles since 1896", 
        :location => "New York, NY", :name => "American Silk Mills"})
f18.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-11.png")
f18.save!

f20 = Factory.create({:phone => "123-456-7890",  :description => "Expert cutting, sewing, quality control, pressing, packaging and shipping.", 
        :location => "Fall River, MA", :name => "Precision Sportswear Inc"})
f20.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-1.png")
f20.save!

f21 = Factory.create({:phone => "234-567-8901",  :description => "Doing business where you live.", 
        :location => "Maiden, NC", :name => "Carolina Mills"})
f21.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk--5.png")
f21.save!

f6 = Factory.create({:phone => "567-890-1234",  :description => "Making someone's favorite shirt", 
        :location => "Albany, NY", :name => "All U Incorporated"})
f6.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-tee-7.png")
f6.save!

f19 = Factory.create({:phone => "901-234-5678",  :description => "Garment Dyeing At Its Best", 
        :location => "Commerce, CA", :name => "Los Angeles Dye & Wash Company"})
f19.photo = URI.parse("https://s3-us-west-2.amazonaws.com/sourceandsew/everlane-silk-10.png")
f19.save!


User.create({:username => "guest", :password => "password"}) #has two favorites
User.create({:username => "almond", :password => "iloveyoualmond"}) #has two favorites
User.create({:username => "walnut", :password => "iloveyouwalnut"}) #has no favorites

Favorite.create({ :user_id => 1, :factory_id => 1})
Favorite.create({ :user_id => 1, :factory_id => 2})

Favorite.create({ :user_id => 2, :factory_id => 3})
Favorite.create({ :user_id => 2, :factory_id => 4})

# Note.create({ :factory_id => 1, :user_id => 3, :content => "note 1"})
# Note.create({ :factory_id => 2, :user_id => 3, :content => "note 2"})
# Note.create({ :factory_id => 3, :user_id => 3, :content => "note 3"})

