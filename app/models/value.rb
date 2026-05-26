class Value < ApplicationRecord

  belongs_to :user
  belongs_to :image

  validates :value,
    presence: true,
    inclusion: { in: 1..5 }

end