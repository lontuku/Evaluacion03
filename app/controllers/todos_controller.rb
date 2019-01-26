class TodosController < ApplicationController
	before_action :find_todo, only: [:show, :edit, :update, :destroy]
	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end 

	def create
		@todo = Todo.new(todo_params)
		@todo.completed = false
		@todo.save
		redirect_to todos_path
	end

	def show

	end 
	
	def edit
	
	end

	def update
		@todo.update(todo_params)
		redirect_to todos_path
	end

	def destroy
		@todo.destroy
		redirect_to todos_path
	end

	private
	def todo_params
		params.require(:todo).permit(:description, :completed)
	end

	def find_todo
		@todo = Todo.find(params[:id])
	end

end
