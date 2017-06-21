class GenericPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def view_assignments?
    true
  end

  def manage_results?
    user.manage_results?(AnyDepartment.new)
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
