module ApplicationHelper

  def get_coords(location)
    # runs geocoder and return long lats for the address returned by yelp
    formatted_address = location.join(" ")
    geocoder_result = Geocoder.search(formatted_address).first
    geocoder_result.data["geometry"]["location"] if (geocoder_result && geocoder_result.data && geocoder_result.data["geometry"])
  end


  def result_coords(results)
    results.businesses.map do |result|
      # uses geocoder to geocode long lats for google map  
      puts result.location.display_address
      address = get_coords(result.location.display_address)
       
      # gets all the information needed from yelp results to put in the info windows
      name = result.name
      display_address = result.location.display_address
      snippet = result.snippet_text
    { "name" => name,
      "address" => address,
      "display_address" => display_address
    }
    end
  end

end
