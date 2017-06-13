namespace :subjects do
  desc "Import subjects from subjects API"
  task :import, [:term, :department] => :environment do |_task, args|
    if !Rails.application.config.read_encrypted_secrets
      abort <<-MSG

        Unable to import subjects from API because you do not have access to
        encrypted secrets. See README section on encrypted secrets.

      MSG
    end

    term = args.fetch(:term) do
      abort "Term is required (e.g. `rake subjects:import[FA2017]`"
    end

    departments = args.fetch(:department) do
      puts "Importing subjects from ABET departments."
      puts "To specify other departments, add department number argument. e.g."
      puts "`rake subjects:import[FA2017,4]` to import department number 4"
      puts
      Department.pluck(:number)
    end

    Array(departments).each do |department|
      puts "Importing subjects for department #{department}"
      SubjectImporter.new(term: term, department: department).run
    end
  end
end
