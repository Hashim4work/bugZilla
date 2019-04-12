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

	def custom_policy
		check_user_in_project
	end

	def edit?
		check_user_in_project
	end

	def destroy?
		check_user_in_project
	end

	def add_user?
		check_user_in_project
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

	def check_user_in_project
		user.present? && user.manager? && user == project.users.find_by(id: user.id)
	end
end
