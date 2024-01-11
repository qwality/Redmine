class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project was successfully created."
    else
      flash[:error] = "Project was not! successfully created."
    end

    redirect_to projects_url(@project)
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = "Project was successfully updated."
    else
      flash[:error] = "Project was not! successfully updated."
    end

    redirect_to project_url(@project)
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    if @project.tasks.any?
      flash[:error] = "Project has tasks. Delete tasks first."
    else
      @project.destroy!
      flash[:success] = "Project was successfully destroyed."
    end

    redirect_to projects_url
  end

  def show_in_table
    @project = Project.find(params[:id])
    render partial: 'projects/show_in_table', locals: {project: @project}
  end

  def edit_in_table
    @project = Project.find(params[:id])
    render partial: 'projects/edit_in_table', locals: {project: @project}
  end

  def new_in_table
    @project = Project.new
    render partial: 'projects/new_in_table', locals: {project: @project}
  end

  def show_in_table_update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      # flash[:success] = "Project was successfully updated."
      render partial: 'projects/show_in_table', locals: {project: @project}
    else
      # flash[:alert] = "Project was not! successfully updated."
      render partial: 'projects/edit_in_table', locals: {project: @project}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.fetch(:project, {})
      params.require(:project).permit(:name, :description)
    end
end
