package verified_credential_schema_valid

import future.keywords.in

default valid = false
default error = null

valid = json.match_schema(input.credential, input.schema)[0]

error = "Credential does not match schema" {
    not valid
}