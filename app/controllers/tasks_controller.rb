class TasksController < ApplicationController
  before_action :set_task, only: %i[ :edit, :update, :destroy ]

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def edit 
  end

  def create
    @task = Task.new(task_params)

    
    if @task.save
      redirect_to tasks_path, notice: "Tarefa foi criada com sucesso."
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentense
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Tarefa foi atulizada com sucesso."    
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentense
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
      redirect_to tasks_url, notice: "Tarefa removida com secesso."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :due_date, :done)
  end
end
