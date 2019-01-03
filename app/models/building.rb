class Building < ApplicationRecord

	def self.record_creation_function(ref, address, zip, city, country, name)

		if Building.is_csv_manager_name_value_different_from_records_values?(ref, name) == 'true'
			Building.create(reference: ref, address: address, zip_code: zip, city: city, country: country, manager_name: name)
		end

	end


	def self.is_csv_manager_name_value_different_from_records_values?(reference, csv_manager_name)

		record_by_building_reference = Building.where(reference: reference)
	
		record_by_building_reference.each do |building|

				previous_names = building.manager_name

				if previous_names == csv_manager_name 
						@a = 'false'
						break		
				else
						@a = 'true'
				end				
		end
		@a
	end
	
end

