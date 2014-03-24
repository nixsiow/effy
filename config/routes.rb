Effy::Application.routes.draw do
  root :to => 'tasks#new'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/tasks/category/:category' => 'tasks#task_input'
  get '/tasks/categories' => 'tasks#categories'
  get '/tasks/:category/tasks_by_category' => 'tasks#index_by_category'
  get '/tasks/archives' => 'tasks#archives'
  get '/tasks/archives/all' => 'tasks#archives_all'
  get '/tasks/archives/:category' => 'tasks#archive_by_category'


  get '/tasks/:id/completed' => 'tasks#completed', :as => 'task_completed'
  get '/tasks/:id/uncompleted' => 'tasks#uncompleted', :as => 'task_uncompleted'

  resources :tasks, :users
end