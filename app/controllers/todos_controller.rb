#todos_controller.rb
class TodosController < ApplicationController
  def index
    #render plain: Todo.all.order(:due_date).map { |todo| todo.to_displayable_string }.join("\n")
    @todos = current_user.todos
    render #index
  end

  def show
    id = params["id"]
    todo = current_user.todos.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    new_todo = current_user.todos.add_task(params)
    #render plain: "new todo created with id #{new_todo.id}"
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save
    #render plain: "changed completed status of todo#{id} to #{completed}"
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
