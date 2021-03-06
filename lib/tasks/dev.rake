# fake restaurant

namespace :dev do 

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    50.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        opening_hours: FFaker::Time.datetime,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
         )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end 
end


# fake user

namespace :dev do 

  task fake_user: :environment do

      20.times do |i|
        user_name = FFaker::Name.first_name
        User.create!(email: "#{user_name}@example.com",
          password: "123456",
          name: "#{user_name}",
          intro: FFaker::HipsterIpsum.paragraph
          )
      end
    puts "have created fake users"
    puts "now you have #{User.count} users data"

  end 
end



# fake comment

namespace :dev do 

  task fake_comment: :environment do

    @restaurants = Restaurant.all
    @users = User.all 

    @restaurants.each do |restaurant|

      3.times do |i|
        Comment.create(content: FFaker::BaconIpsum.sentence,
          restaurant_id: restaurant.id,
          user_id: @users.sample.id
          )
      end
    end

    puts "have created fake 3 comments in every restaurant show page."
    puts "now you have #{Comment.count} comments data"
  end
end 


# fake comment

namespace :dev do 

  task fake_favorite: :environment do

    @restaurants = Restaurant.all
    @users = User.all 

      100.times do |i|
        Favorite.create!(
          user_id: @users.sample.id,
          restaurant_id: @restaurants.sample.id,
          )
      end

    puts "have created fake 100 favorites data."
    puts "now you have #{Favorite.count} Favorites data"
  end
end 



