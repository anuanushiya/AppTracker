class Deploy

  include Mongoid::Document

  field :platform_used, type: String
  field :deployment_date, type: Date
  field :deployed_name, type: String
  
  embedded_in :app

end
