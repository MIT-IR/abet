class Permission
  ADMIN = "CAN EDIT ABET"
  ASSIGNMENTS = "CAN EDIT ASSESSMENTS"
  RESULTS = "CAN EDIT ACTUAL FIELD"
  READ_ONLY = "CAN VIEW ABET"

  MANAGE_ASSIGNMENTS = [ADMIN, ASSIGNMENTS]
  MANAGE_RESULTS = [ADMIN, ASSIGNMENTS, RESULTS]
  ALL = [ADMIN, ASSIGNMENTS, RESULTS, READ_ONLY]

  attr_reader :department_slug, :access_level

  def self.from(account)
    new(account.account_has_access_to, account.function)
  end

  def initialize(department_slug, access_level)
    @department_slug = department_slug
    @access_level = access_level
  end

  def read?(department)
    department_matches?(department) && ALL.include?(access_level)
  end

  def manage_results?(department)
    department_matches?(department) && MANAGE_RESULTS.include?(access_level)
  end

  def manage_assignments?(department)
    department_matches?(department) && MANAGE_ASSIGNMENTS.include?(access_level)
  end

  def admin?(department)
    department_matches?(department) && access_level == ADMIN
  end

  private

  def department_matches?(department)
    department.slug == department_slug if department
  end
end
