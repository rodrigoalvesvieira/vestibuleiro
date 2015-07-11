def puts_colored(str, color=:green)
  if color == :red
    puts "\33[1;31m#{str}\33[m"
  else
    puts "\033[32m#{str}\033[0m"
  end
end

def create_disciplines
  Discipline.destroy_all

  input_file_path = Rails.root.to_s + "/db/disciplines/pt_BR.json"
  input_file = File.read input_file_path

  disciplines = JSON.parse(input_file)["disciplines"]

  disciplines.each do |discipline_hash|
    Discipline.create discipline_hash
  end

  puts_colored "#{Discipline.count} disciplines created.\n"
end

namespace :tags do

  desc "Deletes all tags from the DB"
  task destroy: :environment do
    count = Tag.count
    count_disciplines = Discipline.count

    Tag.destroy_all
    Discipline.destroy_all

    puts_colored "#{count} tags deleted.\n", :red
    puts_colored "#{count_disciplines} disciplines deleted.\n", :red
  end

  desc "Reads the seed input file for Tags and save them in the DB"
  task populate: :environment do
    create_disciplines

    input_file_path = Rails.root.to_s + "/db/tags/pt_BR.json"
    input_file = File.read input_file_path

    disciplines = JSON.parse input_file

    disciplines.keys.each do |discipline|
      discipline_object = Discipline.find_by codename: discipline

      disciplines[discipline].each do |topic|
        discipline_object.tags.create title: topic, tag_name: topic.parameterize
      end
    end

    puts_colored "#{Tag.count} tags created.\n"
  end

end
