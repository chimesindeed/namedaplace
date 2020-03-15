class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\.{1}.{2,}/
  has_secure_password
  
  has_many :places
  
end
  
