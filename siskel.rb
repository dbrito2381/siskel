require 'httparty'

class Siskel
	attr_reader :rating
	attr_reader :year
	attr_reader :plot

	def initialize(title, opts = {} )
		@movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{opts[:year]}&plot=#{opts[:plot]}&tomatoes=true")
		@title = @movie['Title']
		@rating = @movie['Rated']
		@year = @movie['Year']
		@plot = @movie['Plot']
	end

	def title
		if (@title == nil) 
			@title = @movie['Error']
		else
		(@title)
	end
	end

		def consensus
			rating = @movie['tomatoMeter'].to_i
			if ( rating < 25 )
				"2 Thumbs Down"
			elsif (rating <50)
				"Thumbs Down"
			elsif (rating < 75)
				"Thumbs Up"
			else
				"2 Thumbs Up"
			end
		end
 end
