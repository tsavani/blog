# namespace :db do
#   desc "Truncate all tables"
# 	  task :truncate => :environment do
# 	    conn = ActiveRecord::Base.connection
# 	    tables = conn.execute("show tables").map { |r| r[0] }
# 	    tables.delete "schema_migrations"
# 	    tables.each { |t| conn.execute("DELETE FROM #{t}") }

# 			  #   connection = ActiveRecord::Base.connection
# 			  #   connection.disable_referential_integrity do
# 			  #   connection.tables.each do |table_name|
# 			  #     next if connection.select_value("SELECT count(*) FROM #{table_name}") == 0
# 			  #     connection.execute("DELETE FROM #{table_name}")
# 			  #   end
#   end
# end


namespace :db do
  desc "Truncate all existing data"
  task :truncate => "db:load_config" do
   begin
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection
    case config["adapter"]
      when "mysql", "postgresql"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
        end
      when "sqlite", "sqlite3"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
          ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
        end                                                                                                                               
       ActiveRecord::Base.connection.execute("VACUUM")
     end
    end
  end	
end