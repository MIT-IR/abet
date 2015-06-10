require "csv"

class SubjectImporter
  def initialize(path)
    @path = path
  end

  def run
    CSV.foreach(path, headers: true).each do |row|
      if targeted_department_numbers.include?(row["Course Number"].to_i)
        Subject.where(number: row["Subject Id"]).first_or_create!(
          title: row["Subject Title"],
          department_number: row["Course Number"]
        )
      end
    end
  end

  private

  attr_reader :path

  def targeted_department_numbers
    @targeted_department_numbers ||= Department.pluck(:number)
  end
end
