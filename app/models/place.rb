
class Place < ActiveRecord::Base
  belongs_to :user #Active Record method to assign place to User that created it.  Also when User creates place, place gets save to Places table
  
  
end
