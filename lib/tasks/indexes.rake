models = %w(Analytics Answer Comment Discipline Notification Question Subscription Tag User)

namespace :indexes do
  desc "Import the model data into the index"
  task setup: :environment do
    models.each do |model|
      model_class = Object.const_get(model)
      model_class.send(:import)
    end
  end

  desc "Create ElasticSearch indexes for all models"
  task create: :environment do
    models.each do |model|
      model_class = Object.const_get(model)
      model_class.send(:__elasticsearch__).send(:create_index!, force: true)
    end
  end
end
