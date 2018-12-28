class ContactGroups < ApplicationRecord
  belongs_to :contact
  belongs_to :group
end