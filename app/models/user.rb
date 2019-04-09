class User < ApplicationRecord
	enum user_type: [:developer, :manager, :qa]
	#has_many :projects, dependent: :destroy

	has_many :bugs, dependent: :destroy
	has_many :usersprojects, dependent: :destroy
	has_many :projects, :through => :usersprojects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
