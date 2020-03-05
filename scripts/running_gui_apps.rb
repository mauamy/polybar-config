require 'pp'
require 'json'

file = File.read('icons.json')
icon_hash = JSON.parse(file)["icons"]

#pp icon_hash

apps = `bash running_gui_apps.sh`.split("\n")
#pp apps


output = ""

apps.each do |app|
	if icon_hash.key?(app)
		output << icon_hash[app].to_s +  " " 
	end
end

puts output
