class Person < ApplicationRecord

    def self.function(ref, email, home, mobile, first, last, address)
        p "first is : #{first}"
        p 'function'
        p '------'
        hash = {email: email, home_phone_number: home, mobile_phone_number: mobile, address: address}
        hash2 = {}
        hash.each do |key, value|
            p "key is #{key} value is #{value}"
            p '------'
            Person.check(ref, key, value)
            if  @a== "different"
                p 'in function if'
                p 'stockage '
                p '------'
                hash2[key] = value
                p hash2

            elsif @a == 'same'
                p 'in function elsif'

                p key
                p "key is: #{key}"
                old_value = Person.find_by(reference: ref).send(key)
                hash2[key]= old_value
                p hash2[key]
                p hash2
                p '------'
            else
                p 'elsed'
                p '------'
            end
            p 'end of hach.each'
        end
        p "creation reference: #{ref}, email: #{hash2[:email]}, home_phone_number: #{hash2[:home_phone_number]}, mobile_phone_number: #{hash2[:mobile_phone_number]}, firstname: #{first}, lastname: #{last}, address: #{hash2[:address]}"
        Person.create(reference: ref, email: email, home_phone_number: home, mobile_phone_number: mobile, firstname: first, lastname: last, address: address)
        p 'something created'
    end

    def self.check(ref, attribute_name, attribute_value)
        p 'in check method'
        person_by_ref = Person.where(reference: ref)

        p "#{attribute_value}"
        p "person_by_ref: #{person_by_ref}"
        p '-'
        ids = person_by_ref.ids
        p "ids: #{ids}"
        p '-'
        ids.each do |id|
            old_value = Person.find(id).send(attribute_name)
            p "old_value: #{old_value}"
            p "attribute_value: #{attribute_value}"
            p '------'
            if old_value == attribute_value
                @a = 'same'     
                p @a
                break 
            else           
                @a = 'different'
                p @a
                
            end
        end
        @a
    end
end
