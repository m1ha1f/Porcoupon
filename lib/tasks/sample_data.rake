namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    100.times do |x|
    Coupon.create!(title: Faker::Lorem.sentence, 
                   text: Faker::Lorem.paragraph,
                   image_url: "http://i567.photobucket.com/albums/ss120/picz8/get-well-soon/1kfb27fff94f.jpg",
                   deal_url: "google.ro")
    end
  end
end