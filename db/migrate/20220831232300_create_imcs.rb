class CreateImcs < ActiveRecord::Migration[7.0]
  def change
    create_table :imcs do |t|
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
