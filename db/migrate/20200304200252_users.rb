class Users < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.column :name, :text
      t.column :email, :text
      t.column :password, :text
    end
  end
end
