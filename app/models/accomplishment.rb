class Accomplishment < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_rich_text :description

  validates :name, presence: true
end
