require "csv"

class SubjectImporter
  def initialize(path)
    @path = path
  end

  def run
    CSV.foreach(path, headers: true).each do |row|
      if targeted_department_numbers.include?(row["Course Number"].to_s)
        Subject.where(number: row["Subject Id"]).first_or_create!(
          title: row["Subject Title"]
        )
      end
    end
  end

  private

  attr_reader :path

  def targeted_department_numbers
    @targeted_department_numbers ||= Course.pluck(:number).map do |number|
      number.split("-").first
    end.uniq
  end
end
