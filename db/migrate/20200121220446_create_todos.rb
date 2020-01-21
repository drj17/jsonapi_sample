class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
