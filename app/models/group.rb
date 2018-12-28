class Group < ApplicationRecord
  has_many :contact_groups
  has_many :contacts, through: :contact_groups

  validates :name, presence: true, length:{ minimum: 3, maximum: 25}

end
