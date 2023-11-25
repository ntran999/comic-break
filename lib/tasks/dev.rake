desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  usernames = ["alice", "bob", "carol", "dave", "eve"]
  
  usernames.each do |username|

    user = User.new 
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save
  end
  
end
