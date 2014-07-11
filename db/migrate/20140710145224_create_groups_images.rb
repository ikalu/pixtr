class CreateGroupsImages < ActiveRecord::Migration
  def change
    create_table :groups_images do |t|
      t.belongs_to :group, index: true
      t.belongs_to :image, index: true
    end
  end
end
