class ApplicationRecord < ActiveRecord::Base
  include AvoAuthorizable
  
  primary_abstract_class
end
