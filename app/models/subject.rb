class Subject < ActiveRecord::Base
  def to_s
    "#{number} - #{title}"
  end
end
