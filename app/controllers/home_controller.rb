class HomeController < ApplicationController
  def index
    #identify user
    @creds = request.env['eppn']
    @creds = ENV['eppn'] if !Rails.env.production?
    #look up roles
    roles = Roles.for(@creds)
    #see if they have access
    render :no_access if roles.count == 0

    #lookup their departments
    @departments = roles.map do |dept|
      Department.find_by_role_department(dept)
    end

    redirect_to department_path(@departments.first) if @departments.count == 1
  end
end
