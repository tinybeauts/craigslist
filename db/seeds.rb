require 'faker'

100.times do |n|
  Category.create!(:name => Faker::Company.bs,
                   :description => Faker::Company.catch_phrase)
end

cats = Category.all

1000.times do |n|
  cat = cats.sample
  cat.posts.create!(:title => Faker::Company.name,
                    :body => Faker::Lorem.sentence(word_count = 9),
                    :email => Faker::Internet.email,
                    :price => rand(2000))
end
