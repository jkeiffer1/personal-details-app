require "sinatra"
enable :sessions

get '/' do
session[:age] = 21
erb :names
end

post '/name' do
	f_name = params[:username]
redirect '/lastname?first_name=' + f_name
end

get '/lastname' do
	first_name = params[:first_name]
erb :lastnames, locals:{first_n: first_name}
end

post '/l_name' do
	lastname = params[:l_name]
	first_name = params[:f_name]
#	"#{first_name} & #{lastname}"
	redirect '/fav_number?lastname=' + lastname + "&first_name=" + first_name
end

get '/fav_number' do
	first_name = params[:first_name]
	lastname = params[:lastname]
#	"#{first_name} & #{lastname}"
	erb :fav_numbers, locals:{first: first_name, last: lastname, age: session[:age]}	
end

post '/numbers' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num2]
	first = params[:f_name]
	last = params[:l_name]
	"#{num1}, #{num2}, #{num3}, #{first}, #{last},#{session[:age]}"
	redirect '/results?num1=' + num1 + "&num2=" + num2 + "&num3=" + num3 + "&first=" + first + "&last" + last
end

get '/results' do
	first = params[:first]
	last = params[:last]
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	erb :results, locals:{first: first, last: last, age: session[:age]}
end
