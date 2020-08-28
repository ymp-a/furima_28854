class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null: false, default: ""
      t.text       :item_descrption, null: false
      t.integer    :category,        null: false
      t.integer    :status,          null: false
      t.integer    :cost_bearer,     null: false
      t.integer    :consignor,       null: false
      t.integer    :delivery_date,   null: false
      t.integer    :price,           null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
