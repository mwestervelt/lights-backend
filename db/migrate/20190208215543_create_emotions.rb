class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.references :user, foreign_key: true
      t.integer :intensity
      t.string :feeling_type

      t.timestamps
    end
  end
end
