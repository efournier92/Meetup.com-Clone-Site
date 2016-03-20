require 'spec_helper'

feature "user views available meetups" do

  let!(:meetup_01) do
    Meetup.create(
      name: "Launch Fun Time!",
      description: "Fun on Friday",
      location: "Launch Academy HQ",
    )
  end

  let!(:meetup_02) do
    Meetup.create(
      name: "Alphabet Lecture",
      description: "Talks about what interests Launchers",
      location: "Launch Academy HQ",
    )
  end

  scenario "'/meetups' displays a list of all meetups" do
    visit '/'

    expect(page).to have_content "Meetups"
    expect(page).to have_content "Launch Fun Time!"
  end

  scenario "meetups listed in alphabetical order" do
    visit '/'
    first_meetup_position = page.body.index("Alphabet Lecture")
    last_meetup_position  = page.body.index("Launch Fun Time!")
    expect(first_meetup_position).to be < last_meetup_position
  end

  # scenario "clicking a meetup redirects to meetup show page" do
  #   visit '/meetups/Alphabet%20Lecture'
  #   expect(page).to have_content("Alphabet Lecture Details")
  # end

  scenario "clicking 'Create New Meetup' button redirects to New page" do
    visit '/'
    click_link('Create New Meetup')

    expect(page).to have_content('Create a New Meetup')
  end
end
