class TasksController < ApplicationController
  def index
    @tasks = Task.where(:user_id => @current_user.id, :completed => false)
  end

  def create
    task = Task.new params[:task]
    task.category = $category
    task.user_id = @current_user.id
    task.completed = false
    task.save
    redirect_to task
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find params[:id]
  end

  def show
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    task.update_attributes(params[:task])
    redirect_to task
  end

  def destroy
    task = Task.find params[:id]
    task.update_attributes(params[:task])
    redirect_to task
  end

  def task_input
    binding.pry
    # change to an instance variable and pass as a hidden field in form
    @category = params[:category]
    @task = Task.new
    # raise params.inspect
    # @edit_task = Task.find params[:id] # check this 
  end

  def categories
    
  end

  def index_by_category
    @tasks_by_category = Task.where(:user_id => @current_user.id, :category => params[:category], :completed => false)
  end

  def completed
    task = Task.find params[:id]
    task.completed = true
    task.save
    redirect_to tasks_path
  end

  def uncompleted
    task = Task.find params[:id]
    task.completed = false
    task.save
    redirect_to tasks_path
  end

  def archives
    
  end

  def archive_by_category
    @archive_by_category = Task.where(:user_id => @current_user.id, :category => params[:category], :completed => true)
  end

  def archives_all
    @tasks = Task.where(:user_id => @current_user.id, :completed => true)
  end

end
