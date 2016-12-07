require 'httparty'

class Recipe
	include HTTParty

	ENV["FOOD2FORK_KEY"] = '53f7767a73f1cd75f776aa8e79dbcf01'
	base_uri 'http://food2fork.com/api/get'
	default_params key: ENV["FOOD2FORK_KEY"]
	format :json

	def self.for term
		get("/search", query: { q: term })['recipes']
	end
end
