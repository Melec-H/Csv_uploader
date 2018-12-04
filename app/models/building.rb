class Building < ApplicationRecord

    def self.function(ref, address, zip, city, country, name)
        if Building.check(ref, name) == "different"
            p 'avant création record'
            Building.create(reference: ref, address: address, zip_code: zip, city: city, country: country, manager_name: name)
        elsif check(ref, name) == 'same'
            p "#{@a}"
            p 'abborded maybe because "same"'
        else
            p 'elsed'
        end
    end

    def self.check(ref, name)

        building_by_ref = Building.where(reference: ref)
        p "building_by_ref: #{building_by_ref}"
    
        ids = building_by_ref.ids
    
        p "ids: #{ids}"
    
        ids.each do |id|
            old_name = Building.find(id).manager_name
            p "old_name: #{old_name}"
            p "name: #{name}"
            if old_name == name
                @a = 'same'     
                break 
            else
                
                @a = 'different'
                p @a
                
            end
            p "last @a: #{@a}"
    
        end
        p "last @a: #{@a}"
        @a
    end
    
end
