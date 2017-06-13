class Term
  def self.current
    new(Time.now).to_s
  end

  def initialize(time)
    @time = time
  end

  def to_s
    case time.month
    when 1
      "#{time.year}JA"
    when 2,3,4,5
      "#{time.year}SP"
    when 6,7,8
      "#{time.year}SU"
    when 9,10,11,12
      "#{time.year + 1}FA"
    end
  end

  private

  attr_reader :time
end
