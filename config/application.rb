configure :development, :test do
	require 'dotenv'
	Dotenv.load
	require 'pry'
end

configure do
	require 'sinatra/activerecord'
	require 'sinatra/flash'
	require 'omniauth-github'

	Dir[__dir__ + "/../app/**/*.rb"].each do |file|
		require_relative file
	end

	enable :sessions
	set :session_secret, ENV['SESSION_SECRET']

	set :views, 'app/views'
	use OmniAuth::Builder do
		provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user:email'
	end
end
