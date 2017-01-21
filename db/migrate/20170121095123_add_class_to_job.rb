class AddClassToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :classify, :string
  end
end
