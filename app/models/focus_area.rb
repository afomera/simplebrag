class FocusArea < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  scope :by_name, -> { order(name: :asc) }

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
