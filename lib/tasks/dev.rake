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
    puts "now you have #{User.count} restaurants data"

  end 
end

# fake commet

namespace :dev do 

  task fake_comment: :environment do

    @restaurants = Restaurant.all
    @user = User.all 

    @restaurants.each do |restaurant|

      3.times do |i|
        Comment.create(content: FFaker::BaconIpsum.sentence,
          restaurant_id: restaurant.id,
          user_id: @user.sample.id
          )
      end
    end

    puts "have created fake 3 comments in every restaurant show page."
    puts "now you have #{Comment.count} restaurants data"

  end 
end

