class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.date :date
      t.text :currency
      t.decimal :rate

      t.timestamps
    end
  end
end
