class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.date :validity
      t.text :offer
      t.text :address
      t.string :shop_name
      t.text :shop_info
      t.string :contacts
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
