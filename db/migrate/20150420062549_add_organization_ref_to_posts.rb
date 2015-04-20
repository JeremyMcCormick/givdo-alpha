class AddOrganizationRefToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :organization, :string
    add_reference :posts, :organization
  end
end
