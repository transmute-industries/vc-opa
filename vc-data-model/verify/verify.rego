package verify

protectedHeader := io.jwt.decode(input.jwt)[0]
payload := io.jwt.decode(input.jwt)[1]
verified := io.jwt.verify_es256(input.jwt, json.marshal({ 
  # assumes did:jwk
  "keys": [json.unmarshal(base64url.decode(split(protectedHeader.iss, ":")[2]))] 
}))


