class TodosController < ApplicationController
    # before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Todo.all
    end
  
    def new
      @task = Todo.new()
    end
  
    def create
        @task = Todo.create(task_params)
        redirect_to todos_path
    end

    def edit
        @task = Todo.find(params[:id])
    end
    
    def update
        @task = Todo.find(params[:id])
        @task.update(task_params)
        redirect_to todos_url
    end

    def destroy
        @task = Todo.find(params[:id])
        @task.destroy
        redirect_to todos_url
    end
    
    private
        def task_params
            params.require(:todo).permit(:title)
        end
end