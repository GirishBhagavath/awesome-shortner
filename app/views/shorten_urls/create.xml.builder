xml.instruct!
xml.shortened_url do
  xml.parsed_url @shortened_url.get_parsed_url
  xml.url @shortened_url.url
end