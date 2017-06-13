namespace :subjects do
  desc "Import subjects from subjects API"
  task :import, [:term, :department] => :environment do |_task, args|
    if !Rails.application.config.read_encrypted_secrets
      abort <<-MSG

        Unable to import subjects from API because you do not have access to
        encrypted secrets. See README section on encrypted secrets.

      MSG
    end

    term = args.fetch(:term) { Term.current.to_s }
    departments = args.fetch(:department) { Department.pluck(:number) }

    Array(departments).each do |department|
      puts "Importing #{term} subjects for department #{department}"
      SubjectImporter.new(term: term, department: department).run
    end
  end
end
