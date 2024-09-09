class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.references :admin, null: false, foreign_key: true
      t.text :title
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
