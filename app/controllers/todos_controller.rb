#todos_controller.rb
class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render :index
  end

  def show
    id = params["id"]
    todo = current_user.todos.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    new_todo = current_user.todos.new_task(params)
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end

  def all
    render #all
  end
end
