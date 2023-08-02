require "sinatra"
require "sinatra/reloader"
require "http"
require "json"


get("/") do
  erb(:home)
end

get("/meowtivation") do
  raw_data = HTTP.get("https://api.adviceslip.com/advice")
  parsed_data = JSON.parse(raw_data).fetch("slip")
  @advice = parsed_data.fetch("advice")

  
  erb(:cat_advice)
end

get("/meowfacts") do
  raw_data = HTTP.get("https://meowfacts.herokuapp.com/")
  @fact = JSON.parse(raw_data).fetch("data").first

  erb(:cat_fact)
end
