class BugPolicy < ApplicationPolicy


	def new?
		user.present? && user.qa?
	end

	def create?
		user.present? && user.qa?
	end

	def show?
		true
	end


	def destroy?
		user.present? && user == bug.user
	end

	def update_assigner?
		true
	end

	def update_complete?
		user.present? && user.name == bug.assignment
	end
private

	def bug
		record
	end



end
