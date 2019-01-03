require 'csv'

namespace :import do 
	task buildings: :environment do
		filename =  "../csv/buldings2.csv" 
		CSV.foreach(filename, headers: true) do |row|

			ref = row['reference'] 
			address = row['address']
			zip = row['zip_code']
			city = row['city']
			country = row['country']
			name = row['manager_name']
					
			Building.record_creation_for_building(ref, address, zip, city, country, name)
		end
	end

	task person: :environment do
		filename = "../csv/person.csv"
		CSV.foreach(filename, headers: true) do |row|
			ref = row['reference'] 
			email = row['email']
			home = row['home_phone_number']
			mobile = row['mobile_phone_number']            
			first = row['firstname']
			last = row['lastname']
			address = row['address']

			Person.record_creation_for_person(ref, email, home, mobile, first, last, address)

		end   
	end    
end
