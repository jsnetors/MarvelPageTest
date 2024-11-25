require 'httparty'
require 'json'
require 'digest/md5'

class MarvelAPI
  BASE_URL = 'https://gateway.marvel.com:443/v1/public'

  def initialize(public_key, private_key)
    @public_key = public_key
    @private_key = private_key
    @timestamp = Time.now.to_i
    @hash = Digest::MD5.hexdigest("#{@timestamp}#{@private_key}#{@public_key}")
    
    puts "MarvelAPI initialized."
  end

  def get_character_id(character_name = 'Hulk')
    puts "Searching characted ID for: #{character_name}..."

    response = HTTParty.get("#{BASE_URL}/characters", query: {
      name: character_name,
      apikey: @public_key,
      ts: @timestamp,
      hash: @hash
    })
    data = JSON.parse(response.body)

    if data['data']['results'].empty?
      puts "Character not found: #{character_name}."
      puts "Response code: #{data['code']}."
      puts "Response status: #{data['status']}."
      exit
    else
      character_id = data['data']['results'][0]['id']
      puts "Character #{character_name} found with ID: #{character_id}."
      character_id
    end
  end

  def get_random_story(character_name = 'Hulk')
    character_id = get_character_id(character_name)

    puts "Fetching random story containing: #{character_name}..."
  
    response = HTTParty.get("#{BASE_URL}/characters/#{character_id}/stories", query: {
      apikey: @public_key,
      ts: @timestamp,
      hash: @hash
    })
    data = JSON.parse(response.body)
    stories = data['data']['results']

    if stories.empty?
      raise "No story found with #{character_name}."
    else
      puts "One or more stories were found!"
      stories.sample
    end
  end
end
