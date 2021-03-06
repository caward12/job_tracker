require 'rails_helper'

describe "User edits an job company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    category = Category.create(title: "Engineering")
    category2 = Category.create(title: "Testing")
    job = company.jobs.create!(title: "Developer", level_of_interest: 7, city: "Denver", category_id: 2)

    visit edit_company_job_path(company, job)

    select "9", :from=>"job[level_of_interest]"
    select 'Engineering', :from=>'job[category_id]'
    click_button "Update"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")
    expect(page).to have_content("Engineering")
    expect(page).to have_content("9")


  end
end