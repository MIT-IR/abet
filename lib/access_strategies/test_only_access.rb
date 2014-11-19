class TestOnlyAccess
  NO_ACCESS = []
  MULTIPLE_DEPARTMENTS = [
      "D_MECHE Mechanical Engineering",
      "D_NUCENG Nuclear Science and Engineering"
    ]
  SINGLE_DEPARTMENT = [
  		"D_MECHE Mechanical Engineering"
  	]

  @@access = []

  cattr_accessor :access

  def for(creds)
    @@access
  end
end