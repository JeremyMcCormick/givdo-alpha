class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :organization, index: true
      t.references :user, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
