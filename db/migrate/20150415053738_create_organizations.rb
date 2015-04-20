class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :zip
      t.string :city
      t.string :email
      t.string :tax_id
      t.string :site_url
      t.string :donation_url
      t.string :description

      t.timestamps
    end
  end
end
