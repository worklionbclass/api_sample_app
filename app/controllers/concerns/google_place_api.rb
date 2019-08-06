require 'httparty'

class GooglePlaceApi
  attr_accessor :place_id, :image_urls, :key

  FIND_URL = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json"
  DETAIL_URL ="https://maps.googleapis.com/maps/api/place/details/json"

  def initialize(input, key)
    @key = key
    @place_response = find_place_response(input)
    @place_id = get_place_id
    
    if place_id.present?
      @photos = get_photos
      @image_urls = get_image_urls
    else
      @photos = []
      @image_urls = []
    end
  end

  private

  def find_query
    query = {
      inputtype: "textquery",
      fields: "photos,formatted_address,name,place_id",
      key: key
    }
    return query
  end

  def find_place_response(input)
    response = HTTParty.get(
      FIND_URL,
      query: find_query.merge(input: input)
    )

    return response.parsed_response
  end

  def detail_query
    query = {
      fields: "name,rating,formatted_phone_number,photo",
      key: key
    }

    return query
  end

  def find_detail_response
    response = HTTParty.get(
      DETAIL_URL,
      query: detail_query.merge(placeid: place_id)
    )

    return response.parsed_response
  end

  def place_response
    @place_response
  end

  def photos
    @photos
  end

  def get_place_id
    candidates = place_response.dig("candidates")

    if candidates.first.present?
      place_id = candidates.first.dig("place_id")
    else
      place_id = nil
    end

    return place_id
  end

  def get_photos
    result = []

    if place_id.present?
      detail_response = find_detail_response
      photos = detail_response.dig("result", "photos")

      photos.each do |photo|
        result << photo
      end if photos.present?
    end

    return result
  end

  def get_image_urls
    result = []
    default_image_url = "https://maps.googleapis.com/maps/api/place/photo?"

    photos.each do |photo|
      query = {
        maxwidth: photo["width"],
        maxheight: photo["height"],
        photoreference: photo["photo_reference"],
        key: key
      }

      result << default_image_url + query.to_query
    end

    return result
  end

end
