class CreateFavouriteJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :favourite_jobs do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
