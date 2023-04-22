package resolve

# DID Resolver...
# resolve(url) := http.send({
#     "url": url,
#     "method": "GET",
#     "force_cache": true,
#     "force_cache_duration_seconds": 3600 # Cache response for an hour
# })

# normally resolve("https://resolver.example/identifiers/" + input.id).raw_body

jwks := { 
  # "id": input.id,
  "keys":json.unmarshal(base64url.decode(split(input.id, ":")[2])) 
}