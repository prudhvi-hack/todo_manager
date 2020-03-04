class Todo < ActiveRecord::Base
  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    date = due_date.to_s(:long)
    "#{id}. #{date} #{todo_text} #{is_completed} "
  end
end
