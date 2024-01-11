class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  helper_method :state_badge

  # @param [Integer] state
  # @return [String]
  def state_badge(state)
    ['badge bg-primary', 'badge bg-warning', 'badge bg-danger', 'badge bg-success'][state]
  end

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    project_id = @task.project_id

    if @task.save
      flash[:success] = 'Task was successfully created.'
    else
      flash[:alert] = 'Task was not created.'
    end
    redirect_to project_url(project_id)
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)

        # flash[:notice] = 'Task was successfully updated.'
        format.html { head :ok}
        # format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        # format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy

    project_id = @task.project_id
    @task.destroy!

    flash[:success] = 'Task was successfully destroyed.'
    redirect_to project_url(project_id)
  end

  def show_in_table
    @task = Task.find(params[:id])
    render partial: 'tasks/show_in_table', locals: {task: @task}
  end

  def edit_in_table
    @task = Task.find(params[:id])
    render partial: 'tasks/edit_in_table', locals: {task: @task}
  end

  def new_in_table
    @task = Task.new
    render partial: 'tasks/new_in_table', locals: {task: @task}
  end

  def show_in_table_update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render partial: 'tasks/show_in_table', locals: {task: @task}
    else
      render partial: 'tasks/edit_in_table', locals: {task: @task}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.fetch(:task, {})
      params.require(:task).permit(
        :name,
        :description,
        :user_id,
        :state,
        :project_id,
        file_attachments_attributes: [:id, :file, :_destroy]
      )
    end
end
