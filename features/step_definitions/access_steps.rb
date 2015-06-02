#Test access is defined in config/test-roles.yaml
Given /^a user with access to multiple departments$/ do
  ENV['eppn'] = "daries@mit.edu"
end
