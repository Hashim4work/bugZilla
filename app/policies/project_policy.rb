class ProjectPolicy <	ApplicationPolicy

	def index?
		user.present?
	end
	
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
		user.present? && user == project.user
	end

	def destroy?
		user.present? && user == project.user
	end


private

	def project
		record
	end

end