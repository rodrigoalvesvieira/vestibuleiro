# Database seeds for the application

def puts_colored(str)
  puts "\033[32m#{str}\033[0m"
end

questions_file_path = "questions.json"
questions_file = File.open(File.expand_path("../" + questions_file_path, __FILE__))

raw_questions = JSON.parse questions_file.read

models = [Answer, Discipline, Question, Tag, User]

models.each { |model| model.destroy_all }

puts "Creating users..."

pwd = "palavrafacil"

users = User.create([
  { name: "Rodrigo", email: "rodrigo@vestibuleiro.com", password: pwd },
  { name: "Rafael", email: "rafael@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof1", email: "rafael2@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof2", email: "rafael3@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof3", email: "rafael4@vestibuleiro.com", password: pwd , role: "teacher"},
  { name: "Prof4", email: "rafael5@vestibuleiro.com", password: pwd , role: "teacher"},


])

puts_colored "#{User.count} users created.\n"

puts "Creating questions and answers..."

raw_questions["questions"].each do |raw_question|
  question = users.first.questions.create(body: raw_question["body"],title: raw_question["title"])

  raw_question["answers"].each do |raw_answer|
    question.answers.create body: raw_answer["body"]
  end
end

puts_colored "#{Question.count} questions created.\n"
puts_colored "#{Answer.count} answers created.\n"
