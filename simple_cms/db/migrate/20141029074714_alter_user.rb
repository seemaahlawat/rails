class AlterUser < ActiveRecord::Migration

  def up
  	#rename_table("user", "admin_users")
    add_column("admin_users", "username", :string, :limit => 25, :after => "eamil")
    change_column("admin_users", "eamil", :string, :limit => 100)
    rename_column("admin_users", "eamil", "email")
    #rename_table("admin_users","password","hash_passwrod")
    puts "*** adding an index in next string"
    add_index("admin_users","username")
  end

  def down
  end

end
