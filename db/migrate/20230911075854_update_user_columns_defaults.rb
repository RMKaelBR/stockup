class UpdateUserColumnsDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :admin, from: nil, to: false
    change_column_default :users, :status, from: nil, to: false
  end
end
