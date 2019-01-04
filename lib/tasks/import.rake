require 'csv'

namespace :import do 
	task buildings: :environment do
		filename =  "../csv/buldings2.csv" 
		CSV.foreach(filename, headers: true) do |row|
			# why use unneeded variables here ?
			ref = row['reference'] 
			address = row['address']
			zip = row['zip_code']
			city = row['city']
			country = row['country']
			name = row['manager_name']
			
			# query db here like building = Building.where(reference: ref)
			# and use your instance method
			Building.record_creation_for_building(ref, address, zip, city, country, name)
		end
	end

	task person: :environment do
		filename = "../csv/person.csv"
		CSV.foreach(filename, headers: true) do |row|
			# same as above
			ref = row['reference'] 
			email = row['email']
			home = row['home_phone_number']
			mobile = row['mobile_phone_number']            
			first = row['firstname']
			last = row['lastname']
			address = row['address']

			# same as above
			Person.record_creation_for_person(ref, email, home, mobile, first, last, address)

		end   
	end    
end
