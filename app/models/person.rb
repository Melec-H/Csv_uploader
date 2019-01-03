class Person < ApplicationRecord

	def self.record_creation_for_person(ref, email, home, mobile, first, last, address)

		attribute_list_with_csv_values = {email: email, home_phone_number: home, mobile_phone_number: mobile, address: address}
		hash_containing_values_for_the_new_record = {}
		last_record = Person.where(reference: ref).last

		attribute_list_with_csv_values.each do |attribute_name, csv_attribute_value|

			Person.is_csv_attribute_value_different_from_records_values?(ref, attribute_name, csv_attribute_value)
			if  @a == 'true'

				hash_containing_values_for_the_new_record[attribute_name] = csv_attribute_value

			elsif @a == 'false'

				last_record_attribute_value = last_record.send(attribute_name)

				hash_containing_values_for_the_new_record[attribute_name]= last_record_attribute_value

			else
				p 'something wrong'
			end
		end
		
		Person.create(reference: ref, email: hash_containing_values_for_the_new_record[:email], home_phone_number: hash_containing_values_for_the_new_record[:home_phone_number], mobile_phone_number: hash_containing_values_for_the_new_record[:mobile_phone_number], firstname: first, lastname: last, address: hash_containing_values_for_the_new_record[:address])

	end


	def self.is_csv_attribute_value_different_from_records_values?(ref, attribute_name, csv_attribute_value)

		person_by_reference = Person.where(reference: ref)

		person_by_reference.each do |person|

			value_from_record = person.send(attribute_name)

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
