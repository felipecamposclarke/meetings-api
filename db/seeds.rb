require 'faker'

def create_meeting(title)
  Meeting.create(
    title: title,
    description: Faker::Lorem.words(12).join(" "),
    author: Faker::Name.name,
    date: Faker::Date.forward(10),
  )
end


[*10..15].sample.times do |n|
  create_meeting "Meeting #{n}"
end
