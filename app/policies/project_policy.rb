class ProjectPolicy <	ApplicationPolicy

	
	def new?
		user.present? && user.manager?
	end

	def create?
		user.present? && user.manager?
	end

	def show?
		true
	end

	def edit?
		user.present? && user.manager? && user == project.users.find_by(id: user.id)
	end

	def destroy?
		user.present? && user.manager? && user == project.users.find_by(id: user.id)
	end

	def add_user?
		user.present? && user.manager? && user == project.users.find_by(id: user.id)
	end

	def add_user_to_project?
		user.manager? && user == project.users.find_by(id: user.id)
	end

	def remove_user_from_project?
		user.manager? && user == project.users.find_by(id: user.id)
	end
private

	def project
		record
	end

end