require 'csv'

#include ActiveModel::Dirty

namespace :import do 
    task buildings2: :environment do
       filename =  "../csv/buldings.csv"  #içi mon app rails est sur mon bureau, les .csv dans un dossier csv aussi sur le bureau
        CSV.foreach(filename, headers: true) do |row|

            #update_buildings_namestock(row[0], row['manager_name']) 
            ref = row['reference'] 
            address = row['address']
            zip = row['zip_code']
            city = row['city']
            country = row['country']
            name = row['manager_name']
            
            Building.function(ref, address, zip, city, country, name)
        end
    end

    task person: :environment do
        filename = "../csv/person.csv"
        CSV.foreach(filename, headers: true) do |row|
        end   
    end    
end