require 'sinatra'
require 'pony'

get '/' do
  erb :index
end

post '/contact' do
  puts "contact submission: name: #{params[:name]} email: #{params[:email]} message: #{params[:message]}"
  Pony.mail(
    :to => 'easydiscourse@gmail.com',
    :subject => "Easy Discourse Submission",
    :body => "Submission Details:\n\nName:\n#{params[:name]}\n\nEmail:\n#{params[:email]}\n\nMessage:\n#{params[:message]}",
    :via => :smtp,
    :via_options => { 
      :address              => 'smtp.gmail.com', 
      :port                 => '587', 
      :enable_starttls_auto => true, 
      :user_name            => 'easydiscourse', 
      :password             => 'discourseruby', 
      :authentication       => :plain, 
      :domain               => 'localhost.localdomain'
  })
  #redirect to('/thanks')
end

get '/thanks' do
  erb :thanks
end
