class Building < ApplicationRecord
	# Bad method name - It's to implicit. Either put this method in a lib, or rename it
	# to something like "create_from_csv"
	def self.record_creation_for_building(ref, address, zip, city, country, name)
		# your method should return true boolean, not a string
		if Building.is_csv_manager_name_value_different_from_records_values?(ref, name) == 'true'
			# your line is too long (more than 100 chars) hard to read, hard to maintain
			# do this instead :
			Building.create(
				reference: ref,
				address: address,
				zip_code: zip,
				city: city,
				country: country,
				manager_name: name
			)
		end

	end

	# method name is way too long, too long to read
	# also, why not use an instance method here ? instead of querying the database in the model
	# name should be like manager_changed?(new_manager)
	# also use an instance method here
	def self.is_csv_manager_name_value_different_from_records_values?(reference, csv_manager_name)
		# query the db in your lib, or in your task, and your building becomes self.
		record_by_building_reference = Building.where(reference: reference)
		# not needed, should be only one building by reference
		record_by_building_reference.each do |building|
			# why previous_names is plural ? there's only one name
			previous_names = building.manager_name
			
			# this whole if is unneeded. A better way to do it would be :
			# return previous_names == csv_manager_name
			# so it returns true if the condition is met and false if it is not
			if previous_names == csv_manager_name
				# 1. why use an instance variable ???? not needed
				# 2. why is your return a string ? should be either true or false
				@a = 'false'
				# why a break here ? makes no sense to have a loop and a break here
				break		
			else
				@a = 'true'
			end				
		end
		@a
	end
end

