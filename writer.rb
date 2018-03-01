require 'json'

module Writer
  module_function

  def send(studlist_arr)
    File.open("studlist.json", "w") do |f|
      f.write(studlist_arr.to_json)
    end
  end
end
