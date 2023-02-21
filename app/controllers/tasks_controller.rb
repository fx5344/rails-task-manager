class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    if params[:task]["completed"] == "0"
      @task.completed = false
    else
      @task.completed = true
    end
    @task.save
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to task_path(@task)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
