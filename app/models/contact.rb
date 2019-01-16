class Contact < ApplicationRecord
  has_many :contact_groups
  validates :name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
