require 'csv'

#include ActiveModel::Dirty

namespace :import do 
    task buildings2: :environment do
       filename =  "../csv/buldings.csv"  #içi mon app rails est sur mon bureau, les .csv dans un dossier csv aussi sur le bureau
        CSV.foreach(filename, headers: true) do |row|

            #update_buildings_namestock(row[0], row['manager_name'])  
              
            name = row['manager_name']
            p name
            ref = row['reference']
            p ref
            if check(ref, name) == "different"
                p 'avant création record'
                Building.create(reference: row['reference'], address: row['address'], zip_code: row['zip_code'], city: row['city'], country: row['country'], manager_name: row['manager_name'])
            elsif check(ref, name) == 'same'
                p "#{@a}"
                p 'abborded maybe because "same"'
            else
                p 'elsed'
            end
        end
    end
end

def check(ref, name)

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






def update_buildings_namestock(ref, name)

    stock = Building.where(reference: ref).select(:id, :namestock).take 
    
    if stock != nil 
        if stock.namestock == nil || stock.namestock == '' 

            building = Building.find(ref)
            building.update_attribute(:namestock, name)

            p 'first name in namestock: #{name}'

            building.update_attribute(:manager_name, name)

            p "#{name} was added to manager_name"
    
        elsif check_if_same_manager_name(stock, name) == 'different' #-- si name != de tous les éléments de namestock
            
            building = Building.find(ref) 
            manager_name = building.namestock  
            add_to_stock = manager_name + "," + name #-- ICI le stockage du manager_name

            building.update_attribute(:namestock, add_to_stock) #...puis on update :namestock dans la database

            p "#{add_to_stock} was added to namestock" 

            building.update_attribute(:manager_name, name)

            p "#{name} was added to manager_name"
            
        else 
            p 'do nothing'
            
        end      
    end
end

def check_if_same_manager_name(stock, name) #-- Fonction qui regarde namestock et manager_name puis return same/different 

    string = stock.namestock
    p "string: #{string}"
    array = string.split(',') #-- ICI je .split namestock...
    p "array: #{array}"

    array.each do |x| #-- POUR itérer et return different tant que chaque element de namestock est différent de manager_name
        p x
        p name

        if x == name 
            @a = 'same'
            p "name:#{name} is already in Building.namestock"
            break
        else 
            @a = 'different'          
        end

        p @a
    end

    @a
end


    