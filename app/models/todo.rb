class Todo < ApplicationRecord
  belongs_to :user
  has_many :reviews, as: :reviewable
  scope :by_title, -> (title) { 
    where(title: title)
  }

  scope :awaiting_review_by_user_id,
  lambda { |user_id|
    safe_id = ActiveRecord::Base.connection.quote(user_id)
    joins(
      "LEFT JOIN reviews ON reviews.reviewable_id = todos.id AND todos.user_id = #{
        safe_id
      }"
    )
      .where(
      "todos.user_id = #{
        safe_id
      } AND reviews.id IS NULL"
    )
  }

  def self.ransackable_scopes(auth = nil)
    %i[awaiting_review_by_user_id by_title]
  end

end
