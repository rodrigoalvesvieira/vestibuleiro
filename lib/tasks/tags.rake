def puts_colored(str)
  puts "\033[32m#{str}\033[0m"
end

namespace :tags do

  desc "Reads the seed input file for Tags and save them in the DB"
  task populate: :environment do

    input_file_path = Rails.root.to_s + "/db/tags/pt_BR.json"
    input_file = File.read input_file_path

    disciplines = JSON.parse input_file

    disciplines.keys.each do |discipline|
      disciplines[discipline].each do |topic|
        Tag.create tag_name: topic
      end
    end

    puts_colored "#{Tag.count} tags created.\n"
  end

end
