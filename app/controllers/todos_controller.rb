class TodosController < ApplicationController
  before_action :set_default_isDone, only: :create 

  def index
    todos = Todo.order("created_at desc")
    render json: todos
  end

  def create
    todo = Todo.create(todo_params)
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  private

  def todo_params 
    params.require(:todo).permit(:title, :isDone)
  end

  def set_default_isDone
    params[:todo][:isDone] = false
  end
end
