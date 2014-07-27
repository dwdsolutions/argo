namespace :utils do
desc "Populate Countries codes"
   task :to_code => :environment do
	puts "Fill country code"
	json = JSON.parse(IO.read("#{Dir.pwd}/lib/tasks/countries.json"))
	viajes = Travel.all
	viajes.each do |viaje|
	   code = json.map {|h1| h1['cca2'] if h1['translations']['es']==viaje.destination}.compact.first
	   if code
		viaje.destination_code = code
		viaje.save
	   end
	end
   end
end
