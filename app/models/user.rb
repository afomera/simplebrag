class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :accomplishments, dependent: :destroy
  has_many :focus_areas, dependent: :destroy

  after_create do
    focus_areas.create(name: "Personal", color: "#7C3AED")
    focus_areas.create(name: "Work", color: "#E11D48")
    focus_areas.create(name: "Health", color: "#2563EB")
  end
end
