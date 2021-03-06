class User < ActiveRecord::Base
  attr_accessible *attribute_names

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :password, :password_confirmation


end