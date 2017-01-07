class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :content
      t.integer :wage_min
      t.integer :wage_max
      t.string :contact
      t.boolean :is_hidden

      t.timestamps
    end
  end
end
