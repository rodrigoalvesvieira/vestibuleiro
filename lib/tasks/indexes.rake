namespace :indexes do

  desc "Create ElasticSearch indexes for all models"
  task create: :environment do
    models = [Analytics, Answer, Comment, Discipline, Notification, Question, Subscription, Tag, User]

    models.each do |model|
      model.send(:__elasticsearch__).send(:create_index!, force: true)
    end
  end
end
