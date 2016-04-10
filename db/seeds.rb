Company.destroy_all
ConversationQuestion.destroy_all
Conversation.destroy_all
Location.destroy_all
Message.destroy_all
User.destroy_all
Question.destroy_all

nami = User.create(first_name: "Nami", last_name: "S", email: "ns@example.com", password: "funfunfun")
shirley = User.create(first_name: "Shirley", last_name: "Berry", email: "sb@example.com", password: "funfunfun")
liz = User.create(first_name: "Liz", last_name: "Kalina", email: "liz.kalina@gmail.com", password: "funfunfun")
holly = User.create(first_name: "Holly", last_name: "Peck", email: "hp@example.com", password: "funfunfun")
greta = User.create(first_name: "Greta", last_name: "Moseson", email: "gm@example.com", password: "funfunfun")
steph = User.create(first_name: "Steph", last_name: "Goob", email: "ssgoob@example.com", password: "funfunfun")

flatiron = Company.create(name:"Flatiron School")

remote = Location.create(name:"remote")
nyc = Location.create(name:"NYC")
london = Location.create(name:"London")

flatiron.locations << [remote,nyc,london]

departments = ["Sales", "IT", "HR", "Finance", "Marketing"]

User.all.each do |user|
  user.department = departments.sample
  user.location = Location.all.sample
  user.save
end


10.times do
  convo = Conversation.create
  convo.sender = User.all.sample
  convo.recipient = (User.all - [convo.sender]).sample
  convo.save
end

# 20.times do
#   convo = Conversation.all.sample
#   convo.messages.build.content = Faker::Hipster.sentence
#   convo.save
# end

personal = ["What is your dream weekend scenario?","What is your favorite place in the world?","What do you want for your next birthday gift? "]
profesh = ["What motivates you at work?","What do you for your productivity at work?","What can help you to be more productive?"]

personal.each do |q|
  Question.create(subject:"personal",text:q)
end

profesh.each do |q|
  Question.create(subject:"professional",text:q)
end


Conversation.all.each do |convo|
  convo.questions << Question.all.where(subject:"personal").sample
  convo.questions << Question.all.where(subject:"professional").sample
end

