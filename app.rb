require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'recipe'
require_relative 'cookbook'
set :bind, "0.0.0.0"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get "/" do
  @cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  @recipes = @cookbook.all
  erb :index
end

get "/new" do
  erb :new
end

post "/recipes" do
#  @recipe = Recipe.new(params)
 @cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
 @cookbook.add_recipe(Recipe.new(params))
  redirect to('/')
end
# get "/team/:username" do
#   puts params[:username]
#   "The username is #{params[:username]}"
# end

# get "/name" do
#   @usernames = ["Papillard", "ssaunier", "Poupi"]
#   erb :name
# end
