#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  @email = params[:email]
  @area = params[:area]

  f = File.open './public/contacts.txt', 'a'
  f.write "#{@email}, #{@area}\n"
  f.close

  erb :contacts
end

post '/visit' do
  @name = params[:username]
  @phone = params[:phone]
  @time = params[:time]
  @var = params[:variable]
  @color = params[:color]

  f = File.open './public/users.txt', 'a'
  f.write "#{@name}, #{@phone}, #{@time}, #{@var}, #{@color}\n"
  f.close

  erb :visit
end