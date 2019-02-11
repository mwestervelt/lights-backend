class CreateUserEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_emotions do |t|
      t.references :user, foreign_key: true
      t.references :emotion, foreign_key: true
      t.integer :intensity

      t.timestamps
    end
  end
end
