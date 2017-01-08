class SetDefaultHidden < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :is_hidden, :boolean, default: false
    change_column :jobs, :wage_min, :integer, null: false
    change_column :jobs, :wage_max, :integer, null: false
  end
end
