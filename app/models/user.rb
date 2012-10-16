class User < ActiveRecord::Base
  attr_accessible :email, :lastname, :name, :password
end
