# Database seeds for the application

def puts_colored(str)
  puts "\033[32m#{str}\033[0m"
end

models = [User]

models.each { |model| model.destroy_all }

puts "Creating users..."

pwd = "palavrafacil"

users = User.create([
  { name: "Rodrigo", email: "rodrigo@vestibuleiro.com", password: pwd }
])

puts_colored "#{User.count} users created.\n"
