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

get("/meowdy") do
  cat_data = HTTP.get("https://api.thecatapi.com/v1/images/search")
  parsed_cat_data = JSON.parse(cat_data).first
  @cat_image = parsed_cat_data.fetch("url")
  
  erb(:cat_image)
end
