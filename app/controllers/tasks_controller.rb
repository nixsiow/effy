class TasksController < ApplicationController
  before_filter :check_if_logged_in, :except => [:home]
  before_filter :check_if_admin, :only => [:index]

  def home
       
  end

  def index
    @tasks = Task.where(:user_id => @current_user.id, :completed => false)
  end

  def create
    task = Task.new params[:task]
    # Using a global variable here (as you had before $category) is very bad!
    task.category = params['task']['category']
    task.user_id = @current_user.id
    task.completed = false
    task.save
    redirect_to task
  end

  def new
    #raise params.inspect
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
    @category = params[:category].split('?')[0]
    if params[:category].split('?')[1]
      @task = Task.find params[:category].split('?')[1]
    else
      @task = Task.new
    end
  end

  def categories
    
  end

  def index_by_category
    if params[:category] == 'all'
      @tasks_by_category = Task.all
      @category = '' 
    else
      @tasks_by_category = Task.where(:user_id => @current_user.id, :category => params[:category], :completed => false)
      @category = params[:category]
    end
  end

  def completed
    task = Task.find params[:id]
    task.completed = true
    task.save
    redirect_to new_task_path
  end

  def uncompleted
    task = Task.find params[:id]
    task.completed = false
    task.save
    redirect_to new_task_path
  end

  def archives
    
  end

  def archive_by_category
    @archive_by_category = Task.where(:user_id => @current_user.id, :category => params[:category], :completed => true)
  end

  def archives_all
    @tasks = Task.where(:user_id => @current_user.id, :completed => true)
  end


  private
  def check_if_logged_in
      redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
      redirect_to(root_path) if @current_user.nil? || @current_user.admin == false
  end

  def error_test
    render :status => 404
  end
end
