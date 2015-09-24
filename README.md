# awesome-shortner


You can create shortened link api 


URL: http://my-awesome-urlshortner.com/parse_url
Type: POST
format: json or xml
params: 
  url: http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails

if its valid url it'll return 
xml
<?xml version="1.0" encoding="UTF-8"?>
<shortened_url>
  <parsed_url>http://my-awesome-urlshortner.dev/8cf066480a8e5bbc</parsed_url>
  <url>http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails</url>
</shortened_url>

json:

{
  "parsed_url": "http://my-awesome-urlshortner.dev/74a238f842f83a60",
  "url": "http://stackoverflow.com/questions/6021372/best-way-to-create-unique-token-in-rails"
}

