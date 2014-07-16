module ApplicationHelper

  def get_coords(location)
    formatted_address = location.join(" ")

    geocoder_result = Geocoder.search(formatted_address).first
    geocoder_result.data["geometry"]["location"] if (geocoder_result && geocoder_result.data && geocoder_result.data["geometry"])
  end

  def result_coords(results)
    results.businesses.map do |result|
      puts result.location.display_address
      address = get_coords(result.location.display_address)
      name = result.name
      display_address = result.location.display_address
    { "name" => name,
      "address" => address,
      "display_address" => display_address
    }
    end
  end


end
