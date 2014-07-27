namespace :argo do
  desc 'Populate database with information about travels and travelers'
  task :populate_travels do
    puts "Starting to Populate Travels"
    Travel.sync_with_api
  end
end