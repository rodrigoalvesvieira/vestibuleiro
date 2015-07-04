# Database seeds for the application

def puts_colored(str)
  puts "\033[32m#{str}\033[0m"
end

questions_file_path = "questions.json"
questions_file = File.open(File.expand_path("../" + questions_file_path, __FILE__))

raw_questions = JSON.parse questions_file.read

models = [Answer, Discipline, Question, Tag, User, Notification, Subscription]

models.each { |model| model.destroy_all }

puts "Creating users..."

pwd = "palavrafacil"

users = User.create([
  { name: "Rodrigo", email: "rodrigo@vestibuleiro.com", password: pwd },
  { name: "Rafael", email: "rafael@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Artur", email: "artur@vestibuleiro.com", password: pwd },
  { name: "Prof1", email: "rafael2@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof2", email: "rafael3@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof3", email: "rafael4@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof4", email: "rafael5@vestibuleiro.com", password: pwd , role: "teacher"},
])

image_1 = File.open(File.expand_path("../avatars/rav.jpg", __FILE__))
users[0].avatar = image_1
image_1.close
users[0].save!

image_2 = File.open(File.expand_path("../avatars/fastio.jpg", __FILE__))
users[1].avatar = image_2
image_2.close
users[1].save!

image_3 = File.open(File.expand_path("../avatars/artur.jpg", __FILE__))
users[2].avatar = image_3
image_3.close
users[2].save!

puts_colored "#{User.count} users created.\n"

puts "Creating questions and answers..."

raw_questions["questions"].each_with_index do |raw_question, i|
  if i <= 1
    question = users.first.questions.create(body: raw_question["body"],title: raw_question["title"])
  else
    question = users[1].questions.create(body: raw_question["body"],title: raw_question["title"])
  end

  raw_question["answers"].each do |raw_answer|
    question.answers.create body: raw_answer["body"], user_id: users[2].id
  end
end

puts_colored "#{Question.count} questions created.\n"
puts_colored "#{Answer.count} answers created.\n"
