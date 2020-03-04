#todos_controller.rb
class TodosController < ApplicationController
  def index
    render plain: Todo.all.order(:due_date).map { |todo| todo.to_displayable_string }.join("\n")
  end

  def show
    id = params["id"]
    todo = Todo.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    new_todo = Todo.add_task(params)
    render plain: "new todo created with id #{new_todo.id}"
  end
end
