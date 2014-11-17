class AddColumn < ActiveRecord::Migration

  def change
  	add_column :subjects, :page_num, :integer
  end

end
