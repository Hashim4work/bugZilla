class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_custom, only: [:add_user_to_project, :remove_user_from_project, :add_user]
  append_before_action :authorize_resource, except: [:index]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = current_user.projects.build
    authorize @project
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    authorize @project

    @project.users << current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }

      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user_to_project
    user = User.find(params[:user_id])

    @project.users << user if user != @project.users.find_by(id: user.id)

    render 'add_user'
  end

  def remove_user_from_project
    user = User.find(params[:user_id])

    uproject = @project.users.find_by(id: user.id)

    usersproject = Usersproject.find_by(user_id: uproject.id, project_id: @project.id)
    usersproject.destroy if usersproject

    render 'add_user'
  end

  def add_user
    render 'add_user'
  end

private

  def authorize_resource
    authorize @project
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_project_custom
    @project = Project.find(params[:project_id])
  end

  def project_params
    params.require(:project).permit(:title, :description , current_user)
  end
end
