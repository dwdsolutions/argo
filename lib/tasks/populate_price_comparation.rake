require 'mechanize'

API_URL = "http://api.gobiernoabierto.gob.sv"
HEADERS = {
'Authorization' => 'Token token="b852a2ab8f93cb77dd06bebf6356dc80"'
}
agent = Mechanize.new
agent.request_headers = HEADERS

namespace :argo do

   desc "Populate PriceComparation"
   task :populate_price_comparation => [:bonanza, :pizza, :cerveza, :becas, :combustible, :policia]

   desc "Populate PriceComparation table with Pollo Bonanza price"
   task :bonanza => :environment do
	puts "Guardando precio pollo bonanza"
 	price_comparation = PriceComparation.new
	price_comparation.category = "Trivial"
	price_comparation.source_information = "Restaurante Pollo Bonanza"
	price_comparation.unit_cost = 2.75
	price_comparation.description = "Un cuarto de Pollo Bonanza"
	price_comparation.name = price_comparation.description
	price_comparation.save
   end

   desc "Populate PriceComparation table with police salario"
   task :policia => :environment do
	puts "Guardando precio policia"
 	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 424.77
	price_comparation.description = "Salario mensual de Agente de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 487.87
	price_comparation.description = "Salario mensual de Cabo de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 532.60
	price_comparation.description = "Salario mensual de Sargento de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 973.39
	price_comparation.description = "Salario mensual de Subinspector de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 1050.01
	price_comparation.description = "Salario mensual de Inspector de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 1208.70
	price_comparation.description = "Salario mensual de Inspector Jefe de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 1257.20
	price_comparation.description = "Salario mensual de Subcomisionado de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save

	price_comparation = PriceComparation.new
	price_comparation.category = "Salario"
	price_comparation.source_information = "Policia Nacional Civil"
	price_comparation.unit_cost = 1362.55
	price_comparation.description = "Salario mensual de Comisionado de la PNC"
	price_comparation.name = price_comparation.description
	price_comparation.save
   end

   desc "Populate PriceComparation table with Pizza price"
   task :pizza => :environment do
	puts "Guardando precio pizza hut"
	page = agent.get("http://www.pizzahut.com.sv/menus/specializeds")
	html_doc = Nokogiri::HTML(page.body)
	pizzas = html_doc.search("#products .product")

	pizzas.each do |pizza|
	   price_comparation = PriceComparation.new
	   nombre_pizza =  pizza.search(".title h3").text.strip
	   precio = pizza.search(".title .price span").text.gsub("$","").to_f
	   price_comparation.category = "Trivial"
	   price_comparation.source_information = "pizzahut.com.sv"
	   price_comparation.unit_cost = precio
	   if precio < 10
		price_comparation.description = "Pizza Personal #{nombre_pizza}"
	   else
		price_comparation.description = "Pizza Grande #{nombre_pizza}"
	   end	
	   price_comparation.name = price_comparation.description
	   puts "Guardando... #{price_comparation.description}"
	   price_comparation.save
	end
   end

   desc "Populate PriceComparation table with Beer price"
   task :cerveza => :environment do
	puts "Guardando precio cerveza"
	page = agent.get("https://www.superselectos.com/Tienda/Catalogo/cerveza?categoria=209")
	html_doc = Nokogiri::HTML(page.body)
	cervezas = html_doc.search(".ofertas li .producto")
	
	cervezas.each do |cerveza|
		nombre_cerveza = cerveza.search(".nombre").text.strip
		precio_cerveza = cerveza.search(".precio span").text.gsub("$","").strip
		price_comparation = PriceComparation.new
		price_comparation.category = "Trivial"
	   	price_comparation.source_information = "superselectos.com.sv"
	   	price_comparation.unit_cost = precio_cerveza.to_f
	   	price_comparation.description = "#{nombre_cerveza}"	
	   	price_comparation.name = price_comparation.description
	   	puts "Guardando... #{price_comparation.description}"
	   	price_comparation.save
        end

   end

   desc "Populate PriceComparation table with Gas Price"
   task :combustible => :environment do
	puts "Guardando precio combustible"
	page = agent.get("#{API_URL}/hydro_prices?per_page=100")		
	precios_gas = JSON.parse(page.body)

	precios_gas.each do |precio_gas|
	    price_comparation = PriceComparation.new
	    page = agent.get("#{API_URL}/hydro_establishments?&q[id_eq]=#{precio_gas['hydro_establishment_id']}")
	    gasolinera_info = JSON.parse(page.body)
	    gasolinera_name = gasolinera_info[0]["name"]
	    gasolina_price = precio_gas["price"]
	    gasolina_code = precio_gas["product_code"]

	    if gasolina_code == "GR"
	       gasolina_type = "Gasolina Regular"
	    end
	    if gasolina_code == "GS"
	       gasolina_type = "Gasolina Especial"
	    end
	    if gasolina_code == "DO"
	       gasolina_type = "Diesel"
	    end
	    
	    #Extraer dpto, muni de la escuela
	    munis = agent.get("#{API_URL}/cities?&q[id_eq]=#{gasolinera_info[0]['hydro_municipality_id']}")
	    munis_json = JSON.parse(munis.body)
	    muni_name =  munis_json[0]["name"]

	    dptos = agent.get("#{API_URL}/states?&q[id_eq]=#{munis_json[0]['state_id']}")
	    dptos_json = JSON.parse(dptos.body)
	    dpto_name =  dptos_json[0]["name"]
	   
	    price_comparation.description = "Galon de #{gasolina_type} en estacion #{gasolinera_name} (#{muni_name}, #{dpto_name})"
	    price_comparation.category = "Combustible"
	    price_comparation.source_information = "InfoUtil API"
	    price_comparation.unit_cost = gasolina_price
	    price_comparation.name = price_comparation.description
	    puts "Guardando... #{price_comparation.description}"
	    price_comparation.save
	end

   end

   desc "Populate PriceComparation table with students becas"
   task :becas => :environment do |task, args|
	puts "Guardando precios de becas estudiantiles"

	page = agent.get("#{API_URL}/academic_grades?&q[name_cont_any]=bachillerato")
	escuela_name = ""
	bach_name = ""
	matricula = 0
	cuota_mensual = 0
	escuela_n_cuotas = 0
	muni_name = ""
	dpto_name = ""
	price_comparation = PriceComparation.new

	bachilleratos = JSON.parse(page.body)	
	bachilleratos.each do |bach|
		academic_grade_id = bach["id"]
  		page = agent.get("#{API_URL}/school_infos?per_page=10&q[year_eq]=2014&q[academic_grade_id_eq]=#{academic_grade_id}")
  		escuelas = JSON.parse(page.body)

  		bach_name = bach["name"]
  
  		escuelas.each do |escuela|
			page = agent.get("#{API_URL}/schools?&q[id_eq]=#{escuela['school_id']}")
			escuela_info = JSON.parse(page.body)
			escuela_name = escuela_info[0]["name"]
			escuela_n_cuotas = escuela_info[0]["quotas_number"]
			matricula = escuela["enrollment"]
			cuota_mensual = escuela["quota"]

			#Extraer dpto, muni de la escuela
			page = agent.get("#{API_URL}/cities?&q[id_eq]=#{escuela_info[0]['city_id']}")
			muni_info = JSON.parse(page.body)
			muni_name =  muni_info[0]["name"]

			page = agent.get("#{API_URL}/states?&q[id_eq]=#{muni_info[0]['state_id']}")
			dpto_info = JSON.parse(page.body)
			dpto_name =  dpto_info[0]["name"]

			total = matricula + (cuota_mensual * escuela_n_cuotas)

			price_comparation.category = "Educacion"
			price_comparation.source_information = "InfoUtil API"
			price_comparation.unit_cost = total
			price_comparation.description = "Beca anual para #{bach_name} en #{escuela_name}(#{dpto_name},#{muni_name})"
			price_comparation.name = price_comparation.description

			puts "Guardando... #{price_comparation.description}"
		 	price_comparation.save
			price_comparation = PriceComparation.new	  	 	
	  	 	puts "*******************************************************"
  		end
	  end
  end
end
