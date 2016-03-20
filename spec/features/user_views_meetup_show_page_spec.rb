require 'spec_helper'

feature "user views meetup details page" do

  let(:user) do
  User.create(
    provider: "github",
    uid: "1",
    username: "efournier92",
    email: "efournier92@gmail.com",
    avatar_url: "https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/boy-512.png"
  )
  end

  let!(:meetup_01) do
    Meetup.create(
      name: "Bowling",
      description: "Knock down some pins with your pals!",
      location: "Brookline Bowling Alley"
    )
  end

  let!(:attendance) do
    Attendance.create(
      user_id: "3",
      meetup_id: "7",
      creator: true
    )
  end

  scenario "views meetup name" do
    visit '/'
    sign_in_as user
    visit '/meetups/Bowling'

    expect(page).to have_content "Title: Bowling"
    expect(page).to have_content "Description: Knock down some pins with your pals!"
    expect(page).to have_content "Creator: efournier92"
  end

end
