class TasksController < ApplicationController

  before_action :find_task_id, only: [:edit, :update, :show]


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_param)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def edit
    find_task_id
  end

  def update
    find_task_id
    if @task.update(task_param)
      redirect_to task_path
    else
      render 'edit'
    end
  end


  def show
    find_task_id
  end



  private

  def task_param
    params.require(:task).permit(:title, :detail)
  end

  def find_task_id
    @task = Task.find(params[:id])
  end
end
