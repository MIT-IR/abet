namespace :subjects do
  desc "Import subjects for defined departemnts from config/subjects.csv"
  task import: :environment do
    subject_csv = Rails.root.join("config", "subjects.csv")
    SubjectImporter.new(subject_csv).run
  end
end
