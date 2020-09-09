class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postalcode,    null: false, default: ""
      t.integer     :prefecture,    null: false
      t.string      :city,          null: false, default: ""
      t.string      :address,       null: false, default: ""
      t.string      :building_name, null: false, default: ""
      t.string      :phone_number,  null: false, default: ""
      t.references  :deal,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
