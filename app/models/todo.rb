class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :due_date, presence: true

  def to_displayable_string
    is_completed = completed ? "[X]" : "[ ]"
    date = due_date.to_s(:long)
    "#{id}. #{date} #{todo_text} #{is_completed} "
  end

  def self.new_task(new_task)
    todo_text = new_task[:todo_text]
    due_date = new_task[:due_date]
    completed = false
    new(todo_text: todo_text, due_date: due_date, completed: completed)
  end
  def self.due_today
    where("due_date = ?", Date.today)
  end
  def self.overdue
    where("due_date < ? and completed=?", Date.today, false)
  end
  def self.due_later
    where("due_date > ?", Date.today)
  end
  def self.completed
    where("completed = ?", true)
  end
end
