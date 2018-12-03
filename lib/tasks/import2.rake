require 'csv'

#include ActiveModel::Dirty

namespace :import do 
    task buildings2: :environment do
       filename =  "../csv/buldings2.csv"
        CSV.foreach(filename, headers: true) do |row|

            update_buildings_namestock(row[0], row['manager_name'])



            
            
            
        end
    end
end

#def ischanged? (ref, attribute)
#    
#    check = Building.where(reference: ref).select(:id, attribute.to_symbol)
#    p check.changed?

#end



def check_if_same_manager_name(stock, name)

    string = stock.namestock
    p "string: #{string}"
    array = string.split(',')
    p "array: #{array}"
    array.each do |x| 
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

    return @a
end


def update_buildings_namestock(ref, name)

    stock = Building.where(reference: ref).select(:id, :namestock).take 
    
    if stock != nil 

        #si namestock est vide (ce qui n'est pas normal selon ma methode de resolution de l'exercice
        #puisque c'est lors de create.building que l'on stockera
        #pour la premere fois manager_name dans namestock) / c'est pour l'exercice.
        
        if stock.namestock == nil || stock.namestock == '' 

            building = Building.find(ref)
            building.update_attribute(:namestock, name)

            p 'first name in namestock: #{name}'

            building.update_attribute(:manager_name, name)

            p "#{name} was added to manager_name"
    
        elsif check_if_same_manager_name(stock, name) == 'different' #si name != de tous les éléments de namestock
            
            building = Building.find(ref) #on stocke la ligne du record 
            manager_name = building.namestock  #on selectionne l'attribut namestock de cette ligne
            add_to_stock = manager_name + "," + name #on stock dans add_to_stock ce que contient namestock + le nouveau manager_name

            building.update_attribute(:namestock, add_to_stock) #...puis on update :namestock dans la database

            p "#{add_to_stock} was added to namestock" 

            building.update_attribute(:manager_name, name)

            p "#{name} was added to manager_name"
            
        else 
            p 'do nothing'
            
        end      
    end
end


    