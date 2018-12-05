require 'csv'

#include ActiveModel::Dirty

namespace :import do 
    task buildings2: :environment do
       filename =  "../csv/buldings2.csv"  #içi mon app rails est sur mon bureau, les .csv dans un dossier csv aussi sur le bureau
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
            ref = row['reference'] 
            email = row['email']
            home = row['home_phone_number']
            mobile = row['mobile_phone_number']            
            first = row['firstname']
            last = row['lastname']
            address = row['address']

            p '___'
            p '___'
            p '___'
            p '___'
            p '___'
            p ref
            p email
            p home
            p mobile
            p first
            p last
            p address
           
            
            p 'start'

            Person.function(ref, email, home, mobile, first, last, address)
            p 'end'
        end   
    end    
end
