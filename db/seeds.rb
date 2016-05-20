require 'faker'

AVATARS = ['https://cdn2.iconfinder.com/data/icons/faceavatars/PNG/D04.png',
					 'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-128.png',
					 'http://findicons.com/files/icons/175/halloween_avatar/256/mike.png',
					 'https://cdn0.iconfinder.com/data/icons/user-pictures/100/matureman1-128.png',
					 'http://www.megaicons.net/static/img/icons_sizes/126/304/256/bioman-avatar-2-green-icon.png',
					 'http://icons.iconarchive.com/icons/mattahan/ultrabuuf/256/TV-Smith-icon.png']

id = 0
5.times do
	User.create!(
		provider:    'github',
		uid:         id,
		username:    Faker::Internet.user_name,
		email:        Faker::Internet.email,
		avatar_url:  AVATARS[id]
	)
	id += 1
end

Meetup.create!(
	name:        'Cloud Foundry Summit',
	description: 'Enter the cloud, and catch a glimpse of the cutting edge oremote data storage.',
	location:    'Santa Clara, CA' 
)
Meetup.create!(
	name:        'Startup Fest',
	description: "See some of Europe's most promising startups pitch their business plans.",
	location:    'Amsterdam' 
)

Meetup.create!(
	name:        'Cloud Identity Summit',
	description: 'Seminar on keeping user identities safe for modern web interfaces.',
	location:    'New Orleans' 
)

Meetup.create!(
	name:        'Cloud Expo',
	description: 'See the latest cloud technology before it hits the market.',
	location:    'New York' 
)

Meetup.create!(
	name:        'Future of Fintech',
	description: 'Join this meetup if you want to see the future, today!',
	location:    'New York' 
)

Meetup.create!(
	name:        'Startup Extereme',
	description: 'The Norway startup scene is blossoming, join us to get in on the ground floor of something!',
	location:    'Norway' 
)

Meetup.create!(
	name:        'Data By The Bay',
	description: "Talk data management with tech's heaviest hitters, all in the lovely environment of the San Francisco Bay!",
	location:    'San Francisco' 
)

Meetup.create!(
	name:        'Internet Week',
	description: 'A whole week of internet presentations, expositions, and networking opportunities.',
	location:    'New York' 
)

50.times do
	Attendance.create!(
	user_id: rand(4),
	meetup_id: rand(6),
	creator:  rand(1)
	)
end
