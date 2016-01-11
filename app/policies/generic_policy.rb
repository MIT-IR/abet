class GenericPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def create_assessments?
    Course.joins(:department).
      where(departments: { slug: user.department_slugs(Permission::MANAGE_ASSESSMENTS) }).
      with_outcomes.
      any?
  end

  def view_assessments?
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
