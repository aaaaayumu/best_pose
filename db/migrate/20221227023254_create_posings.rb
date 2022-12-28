class CreatePosings < ActiveRecord::Migration[6.0]
  def change
    create_table :posings do |t|
      t.integer :group_id, null: false
      t.integer :category_id, null: false
      t.integer :type_id, null: false
      t.float :body_weight
      t.text :remarks
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
