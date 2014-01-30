crumb :root do
  link "Deutschland", root_path
end

crumb :federal_states do
  link "Bundesländer", federal_states_path
end

crumb :federal_state do |federal_state|
  link federal_state.name, federal_state_path(federal_state)
  parent :federal_states
end

crumb :city do |city|
  link city, federal_state_city_path(city.federal_state, city)
  parent :federal_state, city.federal_state
end

crumb :school do |school|
  link school, city_school_path(school.city, school)
  parent :city, school.city
end

# crumb :year do
#   link year.value, federal_state_year_path(federal_state, year)
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).