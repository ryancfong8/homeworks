class people < ActiveRecord::Migration

  def up
    create_table :products do |t|
      t.string :name
      t.integer :house_id

      t.timestamps
    end
  end

  def down
    drop_table :products
  end

end
