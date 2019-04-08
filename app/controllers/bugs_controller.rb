class BugsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		authorize @bug
		@project.id
		@bug = @project.bugs.create(params[:bug].permit(:title, :deadline, :picture, :bug_type, :bug_status))
		if(@bug.save)
			respond_to do |format|
				format.html { redirect_to project_path(@project)}	
			end
		else
			puts "x"*100
			respond_to do |format|
				format.js
			end
		end
	end

	def update_assigner

		
		@project = Project.find(params[:project_id])
		bug = @project.bugs.find(params[:bug_id])
		authorize bug
		puts current_user.name
		puts 'x'*1000
		bug.update_attribute(:assignment, current_user.name)
		bug.save	

		redirect_to project_path(@project)	
	end

	def update_complete
		@project = Project.find(params[:project_id])
		bug = @project.bugs.find(params[:bug_id])
		authorize bug

		bug.update_attribute(:assignment, 'completed')
		bug.save	

		redirect_to project_path(@project)	
	end


	def destroy
		@project = Project.find(params[:project_id])
		@bug = @project.bugs.find(params[:id])
		authorize @bug
		@bug.destroy

		redirect_to  project_path(@project)
	end
end
