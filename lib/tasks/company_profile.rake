namespace :company_profile do
  desc "Create company profile database"
  task create_db: :environment do
    puts "Creating company profile database..."
    config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "company_profile")

    ActiveRecord::Tasks::DatabaseTasks.create(config.configuration_hash)
    puts "Company profile database created successfully."
  end

  desc "Drop company profile database"
  task drop_db: :environment do
    puts "Dropping company profile database..."
    config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "company_profile")

    ActiveRecord::Tasks::DatabaseTasks.drop(config.configuration_hash)
    puts "Company profile database dropped successfully."
  end

  desc "Migrate company profile database"
  task migrate: :environment do
    puts "Migrating company profile database..."
    config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "company_profile")

    ActiveRecord::Tasks::DatabaseTasks.migrate
    puts "Company profile database migrated successfully."
  end

  desc "Seed company profile database"
  task seed: :environment do
    puts "Seeding company profile database..."
    load(Rails.root.join("db", "company_profile_seeds.rb"))
    puts "Company profile database seeded successfully."
  end

  desc "Reset company profile database"
  task reset: [ :drop_db, :create_db, :migrate, :seed ]

  desc "Setup company profile database"
  task setup: [ :create_db, :migrate, :seed ]
end
