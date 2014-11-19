class Roles
  @@strategy = nil
  
  def self.for(creds)
  	unless @@strategy
  	  klass = Rails.configuration.roles_strategy.constantize
  	  @@strategy = klass.new
    end
    @@strategy.for(creds)
  end
end
