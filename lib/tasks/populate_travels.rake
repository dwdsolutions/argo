namespace :argo do
  desc 'Populate database with information about travels and travelers'
  task :populate_travels, [:page] => :environment do |_, args|
    puts "Starting to Populate Travels"
    page = args.page || 1
    Travel.sync_with_api page: page
  end
end