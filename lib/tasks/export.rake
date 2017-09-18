namespace :export do
  desc "TODO"
  task cities: :environment do
    puts "alias Mehrschulferien.Entities.FederalState"
    puts "alias Mehrschulferien.Repo"
    puts "import Ecto.Query"
    City.all.limit(2).each do |city|
      puts "query = from f in FederalState, where: f.name == \"#{city.federal_state.name}\""
      puts "federal_state = Repo.one(query)"
      puts "{:ok, city} = Mehrschulferien.Entities.create_city(%{name: \"#{city.name}\", slug: \"#{city.slug}\", zip_code: \"#{city.zip_code}\", federal_state_id: federal_state.id, country_id: 1})"
      School.where(city_id: city.id).each do |school|
        puts "{:ok, school} = Mehrschulferien.Entities.create_school(%{name: \"#{school.name}\", slug: \"#{school.slug}\", line1: \"#{school.address_line1}\", line2: \"#{school.address_line2}\", street: \"#{school.street}\", zip_code: \"#{school.zip_code}\", city: \"#{school.address_city_name}\", phone: \"#{school.phone_number}\", fax: \"#{school.fax_number}\", email: \"#{school.email}\", homepage: \"#{school.homepage}\", federal_state_id: federal_state.id, country_id: 1, city_id: city.id})"
      end
    end
  end

  desc "TODO"
  task schools: :environment do
  end

end
