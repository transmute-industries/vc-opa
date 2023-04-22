echo "\n🐉 Decentralize Open Policy Agent (DOPA) \n"

# clean up demo
rm ./demo/*

echo "https://www.w3.org/TR/did-core/#resolution \n"

opa eval --format pretty data.resolve.jwks \
-i ./did/input.json \
-d ./did/resolve.rego > ./demo/jwks.json

echo "https://www.w3.org/TR/vc-data-model/#dfn-verify \n"

opa eval --format pretty data.verify \
-i ./vc-data-model/input.json \
-d ./vc-data-model/verify/verify.rego > ./demo/verified.json

echo "https://www.w3.org/TR/vc-data-model/#validation \n"

opa eval --format pretty data.verified_credential_schema_resolvable \
-s ./vc-data-model/verify/verify.schema.json \
-i ./demo/verified.json \
-d ./vc-data-model/credential-schema/verified_credential_schema_resolvable.rego > ./demo/verified.schema.json

opa eval --format pretty data.verified_credential_schema_valid \
-i ./demo/verified.schema.json \
-d ./vc-data-model/credential-schema/verified_credential_schema_valid.rego > ./demo/verified.validation.json

