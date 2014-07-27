namespace :argo do
  namespace :utilities do
    desc 'Populate country and city from destination field'
    task :populate_country_and_city => :environment do
      travels = Travel.all
      travels.each do |travel|
        city_and_country = travel.destination.split(', ')
        city = city_and_country[0]
        country = city_and_country.length > 1 ? city_and_country[1] : nil
        travel.update_attributes({city: city, country: country})
      end
    end
  end
end