require './api/marvel_api'
require './lib/html_generator'
require 'dotenv/load'
require 'uri'

DEFAULT_HERO_NAME = 'Hulk'
PUBLIC_KEY = ENV['MARVEL_PUBLIC_KEY']
PRIVATE_KEY = ENV['MARVEL_PRIVATE_KEY']

if PUBLIC_KEY.nil? || PRIVATE_KEY.nil?
  raise "Missing Marvel API keys in the environment variables!" 
end

def validate_hero_name(name)
  cleaned_name = name.strip.gsub(/\s+/, ' ')
  URI::DEFAULT_PARSER.escape(cleaned_name)
end

hero_name = validate_hero_name(ARGV[0] || DEFAULT_HERO_NAME)

api = MarvelAPI.new(PUBLIC_KEY, PRIVATE_KEY)
story = api.get_random_story(hero_name)

html_generator = HTMLGenerator.new
html_generator.generate_html(hero_name, story)
