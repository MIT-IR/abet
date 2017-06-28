class AssignmentReport < ApplicationRecord
  def self.for(course)
    where(course_id: course)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names

      all.each do |report|
        csv << report.attributes.values_at(*column_names)
      end
    end
  end

  def period
    "#{semester}-#{year}"
  end

  private

  def read_only?
    true
  end
end
