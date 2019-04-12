class BugsController < ApplicationController
  before_action :set_project, only: [:create, :update_assigner, :update_complete, :destroy]
  before_action :set_bug, except: :create

  def create
		@project.id

		@bug = @project.bugs.create(project_params)

		authorize @bug

		if(@bug.save)
			respond_to do |format|
				format.html { redirect_to project_path(@project)}
			end

		else
			respond_to do |format|
				format.js
			end
		end
	end

	def update_assigner
		authorize bug

		bug.update_attribute(:assignment, current_user.name)

		if bug.bug_type == 'bug'
			bug.update_attribute(:bug_status, 'started')

		else
			bug.update_attribute(:bug_status, 'started')
		end

		bug.save

		redirect_to project_path(@project)
	end

	def update_complete
    authorize bug

		bug.update_attribute(:assignment, 'completed')

    if bug.bug_type == 'bug'
			bug.update_attribute(:bug_status, 'resolved')

    else
			bug.update_attribute(:bug_status, 'completed')
		end

    bug.save

		redirect_to project_path(@project)
	end


	def destroy
    authorize @bug

    @bug.destroy

		redirect_to  project_path(@project)
	end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_bug
      bug = @project.bugs.find(params[:bug_id])
    end
    def project_params
      params[:bug].permit(:title, :deadline, :picture, :bug_type, :bug_status, :user_id)
    end
end
