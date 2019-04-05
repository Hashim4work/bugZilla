class BugsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
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


	def destroy
		@project = Project.find(params[:project_id])
		@bug = @project.bugs.find(params[:id])
		@bug.destroy

		redirect_to  project_path(@project)
	end
end
