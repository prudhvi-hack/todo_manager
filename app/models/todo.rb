class Todo < ActiveRecord::Base
  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    date = due_date.to_s(:long)
    "#{id}. #{date} #{todo_text} #{is_completed} "
  end

  def self.add_task(new_task)
    todo_text = new_task["todo_text"]
    due_date = DateTime.parse(new_task["due_date"])
    completed = false
    create!(todo_text: todo_text, due_date: due_date, completed: completed)
  end
end
