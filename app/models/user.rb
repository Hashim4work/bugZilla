class User < ApplicationRecord
	enum user_type: [:developer, :manager, :qa]
	#has_many :projects, dependent: :destroy
	before_destroy :check_for_projects

	has_many :bugs, dependent: :destroy
	has_many :usersprojects, dependent: :destroy
	has_many :projects, :through => :usersprojects


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	private

	def check_for_projects
		if self.manager?
			projects = Project.all
			projects.each do |project|
				if project.users.find_by(id: self.id).present?
					project.destroy
				end
			end
		end
	end
end
