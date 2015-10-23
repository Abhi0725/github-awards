require 'rails_helper'

describe OpenStreetMapClient do
  
  let(:valid_response) { [{"place_id"=>"127778164", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"relation", "osm_id"=>"175905", "boundingbox"=>["40.477399", "40.917577", "-74.2590899", "-73.7001714"], "lat"=>"40.7305991", "lon"=>"-73.9865812", "display_name"=>"New York City, New York, United States of America", "class"=>"place", "type"=>"city", "importance"=>0.98292818999099, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_city.p.20.png", "address"=>{"city"=>"New York City", "state_district"=>"New York City", "state"=>"New York", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"127326988", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"relation", "osm_id"=>"61320", "boundingbox"=>["40.477399", "45.0158611", "-79.76251", "-71.7897328"], "lat"=>"43.1561681", "lon"=>"-75.8449946", "display_name"=>"New York, United States of America", "class"=>"boundary", "type"=>"administrative", "importance"=>0.9704572196627, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_boundary_administrative.p.20.png", "address"=>{"state"=>"New York", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"1388704", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"316976731", "boundingbox"=>["40.1247714", "41.4047714", "-74.620764", "-73.340764"], "lat"=>"40.7647714", "lon"=>"-73.980764", "display_name"=>"New York, New York City, New York, United States of America", "class"=>"place", "type"=>"county", "importance"=>0.65, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_boundary_administrative.p.20.png", "address"=>{"county"=>"New York", "city"=>"New York City", "state"=>"New York", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"22071652", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"2218262347", "boundingbox"=>["55.0052998", "55.0452998", "-1.5069496", "-1.4669496"], "lat"=>"55.0252998", "lon"=>"-1.4869496", "display_name"=>"New York, Tyne and Wear, North East England, England, United Kingdom", "class"=>"place", "type"=>"village", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"village"=>"New York", "county"=>"Tyne and Wear", "state_district"=>"North East England", "state"=>"England", "country"=>"United Kingdom", "country_code"=>"gb"}}, {"place_id"=>"398932", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"153498537", "boundingbox"=>["30.8185202", "30.8585202", "-87.2208048", "-87.1808048"], "lat"=>"30.8385202", "lon"=>"-87.2008048", "display_name"=>"New York, Santa Rosa County, Florida, United States of America", "class"=>"place", "type"=>"hamlet", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"hamlet"=>"New York", "county"=>"Santa Rosa County", "state"=>"Florida", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"388388", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"151937435", "boundingbox"=>["39.6652874", "39.7052874", "-93.9468836", "-93.9068836"], "lat"=>"39.6852874", "lon"=>"-93.9268836", "display_name"=>"New York, Caldwell County, Missouri, United States of America", "class"=>"place", "type"=>"village", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"village"=>"New York", "county"=>"Caldwell County", "state"=>"Missouri", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"357311", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"151400404", "boundingbox"=>["40.8316701", "40.8716701", "-93.2799318", "-93.2399318"], "lat"=>"40.8516701", "lon"=>"-93.2599318", "display_name"=>"New York, Wayne County, Iowa, United States of America", "class"=>"place", "type"=>"hamlet", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"hamlet"=>"New York", "county"=>"Wayne County", "state"=>"Iowa", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"394061", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"153599131", "boundingbox"=>["36.9689428", "37.0089428", "-88.9725629", "-88.9325629"], "lat"=>"36.9889428", "lon"=>"-88.9525629", "display_name"=>"New York, Ballard County, Kentucky, United States of America", "class"=>"place", "type"=>"hamlet", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"hamlet"=>"New York", "county"=>"Ballard County", "state"=>"Kentucky", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"367626", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"151629828", "boundingbox"=>["35.0386534", "35.0786534", "-107.5472717", "-107.5072717"], "lat"=>"35.0586534", "lon"=>"-107.5272717", "display_name"=>"New York, Cibola County, New Mexico, United States of America", "class"=>"place", "type"=>"hamlet", "importance"=>0.475, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"hamlet"=>"New York", "county"=>"Cibola County", "state"=>"New Mexico", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"382240", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"151917270", "boundingbox"=>["32.1479321", "32.1879321", "-95.6891277", "-95.6491277"], "lat"=>"32.1679321", "lon"=>"-95.6691277", "display_name"=>"New York, Henderson County, Texas, United States of America", "class"=>"place", "type"=>"hamlet", "importance"=>0.45089190172262, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_place_village.p.20.png", "address"=>{"hamlet"=>"New York", "county"=>"Henderson County", "state"=>"Texas", "country"=>"United States of America", "country_code"=>"us"}}] }
  let(:invalid_response) { [] }
  let(:country_only) { [{"place_id"=>"127658196", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"relation", "osm_id"=>"148838", "boundingbox"=>["-14.7608357", "71.6048217", "-179.9999999", "180"], "lat"=>"39.7837304", "lon"=>"-100.4458825", "display_name"=>"United States of America", "class"=>"boundary", "type"=>"administrative", "importance"=>1.144692348398, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/poi_boundary_administrative.p.20.png", "address"=>{"country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"60476969", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"way", "osm_id"=>"27423181", "boundingbox"=>["14.4830636", "14.4882325", "121.0206884", "121.0222591"], "lat"=>"14.4858002", "lon"=>"121.0218547", "display_name"=>"United States, Better Living Subdivision, Don Bosco, Parañaque, Metro Manila, 1006, Philippines", "class"=>"highway", "type"=>"residential", "importance"=>0.3, "address"=>{"road"=>"United States", "neighbourhood"=>"Better Living Subdivision", "suburb"=>"Don Bosco", "village"=>"Don Bosco", "county"=>"Parañaque", "state"=>"Metro Manila", "postcode"=>"1006", "country"=>"Philippines", "country_code"=>"ph"}}, {"place_id"=>"114115020", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"way", "osm_id"=>"250575475", "boundingbox"=>["40.7369018", "40.737504", "-73.8627532", "-73.8622347"], "lat"=>"40.7372029", "lon"=>"-73.8624939066297", "display_name"=>"United States, 97-30, 57th Avenue, LeFrak City, Queens County, New York City, New York, 11368, United States of America", "class"=>"building", "type"=>"yes", "importance"=>0.201, "address"=>{"building"=>"United States", "house_number"=>"97-30", "road"=>"57th Avenue", "neighbourhood"=>"LeFrak City", "county"=>"Queens County", "city"=>"New York City", "state"=>"New York", "postcode"=>"11368", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"125647568", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"way", "osm_id"=>"315105904", "boundingbox"=>["38.940448", "38.9427076", "-77.120061", "-77.1182113"], "lat"=>"38.94158115", "lon"=>"-77.1185589880968", "display_name"=>"United States, United States of America", "class"=>"boundary", "type"=>"protected_area", "importance"=>0.201, "address"=>{"address100"=>"United States", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"125647735", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"way", "osm_id"=>"315105902", "boundingbox"=>["38.9661524", "38.9679981", "-77.1380857", "-77.1373315"], "lat"=>"38.96692885", "lon"=>"-77.1376750544799", "display_name"=>"United States, United States of America", "class"=>"boundary", "type"=>"national_park", "importance"=>0.201, "address"=>{"address100"=>"United States", "country"=>"United States of America", "country_code"=>"us"}}, {"place_id"=>"18767684", "licence"=>"Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", "osm_type"=>"node", "osm_id"=>"1865902396", "boundingbox"=>["36.2983416", "36.2984416", "-84.2179638", "-84.2178638"], "lat"=>"36.2983916", "lon"=>"-84.2179138", "display_name"=>"Caryville Post Office, Hill Street, Caryville, Campbell County, Tennessee, 37714, United States of America", "class"=>"amenity", "type"=>"post_office", "importance"=>0.201, "icon"=>"http://nominatim.openstreetmap.org/images/mapicons/amenity_post_office.p.20.png", "address"=>{"post_office"=>"Caryville Post Office", "road"=>"Hill Street", "town"=>"Caryville", "county"=>"Campbell County", "state"=>"Tennessee", "postcode"=>"37714", "country"=>"United States of America", "country_code"=>"us"}}] }
  let(:client) { OpenStreetMapClient.new }
  
  describe "geocode" do
    context "valid location" do
      it "returns city and country" do
        HTTParty.stubs(:get).returns(double(body: valid_response.to_json))
        expect(client.geocode("New York")).to eq({city: "New York City", country: "United States of America"})
      end
    end
    
    context "invalid location" do
      it "returns nil" do
        HTTParty.stubs(:get).returns(double(body: invalid_response.to_json))
        expect(client.geocode("New York")).to eq(nil)
      end
    end
    
    context "cannot find city" do
      it "return only country" do
        HTTParty.stubs(:get).returns(double(body: country_only.to_json))
        expect(client.geocode("United States")).to eq({city: nil, country: "United States of America"})
      end
    end
  end
end