class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :reviewable, null: false, polymorphic: true, type: :uuid

      t.timestamps
    end
  end
end
