namespace :user do
  desc "Create a new user"
  task :create, [ :email, :password ] => :environment do |t, args|
    email = args[:email] || ask("Email: ")
    password = args[:password] || ask("Password: ")

    user = User.new(email: email, password: password, password_confirmation: password)

    if user.save
      puts "User '#{email}' created successfully"
    else
      puts "Failed to create user: #{user.errors.full_messages.join(', ')}"
    end
  end

  desc "List all users"
  task list: :environment do
    puts "Users:"
    User.all.each do |user|
      puts "- #{user.email} (ID: #{user.id})"
    end
    puts "Total: #{User.count} users"
  end

  private

  def ask(prompt)
    print prompt
    STDIN.gets.chomp
  end
end
