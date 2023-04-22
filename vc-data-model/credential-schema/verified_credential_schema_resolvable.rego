package verified_credential_schema_resolvable

jwks_request(url) := http.send({
    "url": url,
    "method": "GET",
    "force_cache": true,
    "force_cache_duration_seconds": 3600 # Cache response for an hour
})

credential := input.payload

# normally yaml.unmarshal(jwks_request(credential.credentialSchema.id).raw_body)
schema := yaml.unmarshal(jwks_request("https://transmute-industries.github.io/vc-json-schema/example/NewCredentialType.yaml").raw_body)


