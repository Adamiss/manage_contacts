class CreateContactGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_groups do |t|
      t.string :contact_id
      t.string :group_id
    end
  end
end
