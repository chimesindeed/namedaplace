class User < ActiveRecord::Base
  validates_uniqueness_of :email #making sure no duplicate emails
  validates_format_of :email, :with => /.+@.+\.{1}.{2,}/ #googled email regex format validation
  has_secure_password #bcrypt gem password authentification
  has_many :places #User has many places Relationship
  
end
  
