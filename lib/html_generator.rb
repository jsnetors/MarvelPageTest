require 'time'

class HTMLGenerator
  def generate_html(hero_name, story)
    timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
    filename = "public/random_#{hero_name}_story_#{timestamp}.html"

    File.open(filename, 'w') do |file|
      file.puts "<!DOCTYPE html>"
      file.puts "<html lang='en'>"
      file.puts "<head>"
      file.puts "  <meta charset='UTF-8'>"
      file.puts "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
      file.puts "  <title>Marvel Story: #{story['title']}</title>"
      file.puts "  <style>"
      file.puts "    body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; background-color: #f9f9f9; color: #333; }"
      file.puts "    h1 { color: #0073e6; }"
      file.puts "    h2 { color: #005bb5; margin-top: 20px; }"
      file.puts "    ul { list-style-type: disc; padding-left: 20px; }"
      file.puts "    li { margin-bottom: 5px; }"
      file.puts "    p { margin: 10px 0; }"
      file.puts "    .footer { font-size: 0.8em; margin-top: 30px; color: #555; }"
      file.puts "  </style>"
      file.puts "</head>"
      file.puts "<body>"
      file.puts "  <h1>#{story['title']}</h1>"
      file.puts "  <p>#{story['description'] || 'No description available for this story.'}</p>"
      file.puts "  <h2>Characters:</h2>"
      file.puts "  <ul>"
      story['characters']['items'].each do |character|
        file.puts "    <li>#{character['name']}</li>"
      end
      file.puts "  </ul>"
      file.puts "  <p class='footer'>Data provided by Marvel. © 2024 Marvel</p>"
      file.puts "</body>"
      file.puts "</html>"
    end

    puts "File created successfully: #{filename}"
    puts "file:///#{File.expand_path(filename)}"
  end
end
