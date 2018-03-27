class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise 	:database_authenticatable, 
  			:registerable,
         	:recoverable, 
         	:rememberable, 
         	:trackable, 
         	:validatable

	# OlivR - relation one to many users / userstats 
 	has_many :userstats 

end
