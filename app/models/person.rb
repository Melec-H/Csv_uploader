class Person < ApplicationRecord
	# same as building - bad method name
	# alse: "first", "last" attributes ??? I don't understand when reading the method alone.
	def self.record_creation_for_person(ref, email, home, mobile, first, last, address)
		# variable name too long - also line too long
		attribute_list_with_csv_values = {email: email, home_phone_number: home, mobile_phone_number: mobile, address: address}

		# don't say it's a hash in the variable name if it's a hash
		# like you wouldn't say string_name = "toto" for the name var
		# also I don't understand your variable. Maybe the name is wrong
		hash_containing_values_for_the_new_record = {}

		# .last not needed. uniqueness is by reference
		last_record = Person.where(reference: ref).last

		# why not call this variable : attributes_to_check or something ? much clearer
		attribute_list_with_csv_values.each do |attribute_name, csv_attribute_value|
			# line too long - also method name too long, but clear.
			Person.is_csv_attribute_value_different_from_records_values?(ref, attribute_name, csv_attribute_value)

			# why use an instance variable instead of the return value of the function?
			# same as building, you're comparing a string, not a boolean
			if  @a == 'true'
				# name this variable new_record
				hash_containing_values_for_the_new_record[attribute_name] = csv_attribute_value
			elsif @a == 'false'

				last_record_attribute_value = last_record.send(attribute_name)
				hash_containing_values_for_the_new_record[attribute_name]= last_record_attribute_value

			else
				# not needed. it's either 'true' or 'false'
				p 'something wrong'
			end
		end
		# line way too long. Also, you should use :
		# Person.create(hash_containing_values_for_the_new_record.merge({reference: ref}))
		# and name the keys in the hash_containing_values_for_the_new_record better.
		# saves you a lot of code reading
		Person.create(reference: ref, email: hash_containing_values_for_the_new_record[:email], home_phone_number: hash_containing_values_for_the_new_record[:home_phone_number], mobile_phone_number: hash_containing_values_for_the_new_record[:mobile_phone_number], firstname: first, lastname: last, address: hash_containing_values_for_the_new_record[:address])

	end

	# variable name too_long
	# why not is_new_attribute?(ref, attribute, value)
	def self.is_csv_attribute_value_different_from_records_values?(ref, attribute_name, csv_attribute_value)
		# same as building
		person_by_reference = Person.where(reference: ref)
		# each not needed
		person_by_reference.each do |person|

			value_from_record = person.send(attribute_name)
			# same as building : return value_from_record == csv_attribute_value
			if value_from_record == csv_attribute_value
				@a = 'false'     
				break 
			else           
				@a = 'true'		
			end

		end
		@a
	end

end
