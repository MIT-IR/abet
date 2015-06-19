class GenericPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def create_assessments?
    user.manage_assessments?(AnyDepartment.new)
  end

  def view_assessments?
    true
  end

  class AnyDepartment
    def slug
      self
    end

    def ==(_other)
      true
    end
  end

  private_constant :AnyDepartment
end
