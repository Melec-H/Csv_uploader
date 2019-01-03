Hello,

the importation tasks are in lib/tasks/import.rake

The function record_creation_for_building in models/buildings.rb create a new record if the manager_name in the CSV is different from every manager_name's value from the records where the reference is the same. Else it does nothing.

The function record_creation_for_person in models/person.rb always create a new record. The new record attributes value are either the values from the last record about that person or the values contained in the CSV.

Indentations in github isnt showed how I configured it on my IDE.

Melec du Halgouet
