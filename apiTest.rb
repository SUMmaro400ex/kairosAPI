
require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'
require 'JSON'
require 'pp'

values = '{
  "image": "https://saintsonly.files.wordpress.com/2012/09/jennifer-lopez-troy-jensen-11.jpg",
  "subject_id": "Jennifer Lopez",
  "gallery_name": "gallerytest1",
  "selector": "SETPOSE",
  "symmetricFill": "true"
}'

headers = {
  'content_type'=> "application/json",
  'app_id'=> "1ed1a48c",
  'app_key'=> "c26ac21ae28340035f9bbe2cd0918f48"
}
#
response = RestClient.post 'https://api.kairos.com/enroll', values, headers
puts response


values = '{
  "image": "https://saintsonly.files.wordpress.com/2012/09/jennifer-lopez-troy-jensen-11.jpg",
  "gallery_name": "gallerytest1"
}'

headers = {
  'content_type' => 'application/json',
  'app_id'=> "1ed1a48c",
  'app_key'=> "c26ac21ae28340035f9bbe2cd0918f48"
}

response = RestClient.post 'https://api.kairos.com/recognize', values, headers
confidence = response
response = JSON.parse(response)["images"][0]["transaction"]["subject"]
confidence = JSON.parse(confidence)["images"][0]["transaction"]["confidence"]
confidence = (confidence.to_f)*100
rounded = confidence.round(2)
puts "#{response} #{rounded}%"
# puts confidence

values = '{
  "image": "https://saintsonly.files.wordpress.com/2012/09/jennifer-lopez-troy-jensen-11.jpg",
  "selector": "SETPOSE"
}'

headers = {
  'content_type' => 'application/json',
  'app_id' => '1ed1a48c',
  'app_key' => 'c26ac21ae28340035f9bbe2cd0918f48'
}

response = RestClient.post 'https://api.kairos.com/detect', values, headers
pp JSON.parse(response)
