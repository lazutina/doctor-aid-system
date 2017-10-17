class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer "account_unit"
      t.integer "account"
      t.integer "sub_account"
      t.integer "vendor"
      t.string "lawson_item_number"
      t.string "description"
      t.string "mfg_code"
      t.string "mfg_nbr"
      t.date "po_date"
      t.integer "po_number", limit: 8
      t.integer "po_line"
      t.integer "qty"
      t.string "uom"
      t.float "unit_cost"
      t.float "total_cost"
    end
  end
end
