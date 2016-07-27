class AddRemarkToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :remark, :text
  end
end
