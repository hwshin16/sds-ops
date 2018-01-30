# https://network.pivotal.io/api/v2/products/elastic-runtime/releases/32638/product_files/63747/download
# 1. Accept license agreement
#
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Token bDFRn1EcD3Ly9AmrxdkN" -X POST https://network.pivotal.io/api/v2/products/elastic-runtime/releases/32638/eula_acceptance

# 2. Downalod PAS
wget --post-data="" --header="Authorization: Token bDFRn1EcD3Ly9AmrxdkN" https://network.pivotal.io/api/v2/products/elastic-runtime/releases/32638/product_files/63747/download -O "cf-2-small.pivotal"


# 3. Ops Manager Access Token 받기
#   주의 : Ops Manager URL은 본인 URL로 변경

curl -s -k -H 'Accept: application/json;charset=utf-8' -d 'grant_type=password' -d 'username=admin' -d 'password=admin' -u 'opsman:' https://pcf.sds61.cfpush.net/uaa/oauth/token

# 4. PAS binary upload
#   주의 : Authorization Header의 값을 3번에서 받은 Access Token 값으로 변경
#   주의 : Ops Manager URL은 본인 URL로 변경

curl -vv -H 'Authorization: bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImtleS0xIiwidHlwIjoiSldUIn0.eyJqdGkiOiJjMjQwZWUxYWRkYmQ0OWI5YWNhNzIxYmRlODkyODk3NCIsInN1YiI6IjM2YTkzNGI2LWExNGItNDBlOC1iMzVhLWQ4YjJjNzdkNzJjZSIsInNjb3BlIjpbIm9wc21hbi5hZG1pbiIsInNjaW0ubWUiLCJjbGllbnRzLmFkbWluIiwidWFhLmFkbWluIl0sImNsaWVudF9pZCI6Im9wc21hbiIsImNpZCI6Im9wc21hbiIsImF6cCI6Im9wc21hbiIsImdyYW50X3R5cGUiOiJwYXNzd29yZCIsInVzZXJfaWQiOiIzNmE5MzRiNi1hMTRiLTQwZTgtYjM1YS1kOGIyYzc3ZDcyY2UiLCJvcmlnaW4iOiJ1YWEiLCJ1c2VyX25hbWUiOiJhZG1pbiIsImVtYWlsIjoiYWRtaW5AdGVzdC5vcmciLCJhdXRoX3RpbWUiOjE1MTczMzA0NjMsInJldl9zaWciOiI3ZTdlYzEzMCIsImlhdCI6MTUxNzMzMDQ2MywiZXhwIjoxNTE3MzczNjYzLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODAvdWFhL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiYXVkIjpbInNjaW0iLCJvcHNtYW4iLCJjbGllbnRzIiwidWFhIl19.KkPBzKXEQ7wqXpjagi7avsEy2yR2ZUJ5JnLqhvthJ2C1X5Sgo9W9EO3-t3PYr9VkeqJGHDsKjNbqN3EuIh2DDPrkljgWE8CokSx2XgSCf01uqpJj3BMTXvyT6OaodJvorsIh_mJ9gXJ4ySo0xtR6ooxoD_BEYHi-8StB6V7sA3bU7auy6YNu8TqQBfTBlGEtTz_Nn0kGXdR_AwawBqJpvmp9842rjfINtjRTcb_1m_FLsVNh_bNQhA7A-yIebXZQv73Oyw2sKu35yp-HutMFoyJeOQivdPRGVogn7MFPAR-incAR452Qi9-cFxqa7HjRYKS2roKaxtJOp-Rvp3FhSw' -k -X POST https://pcf.sds61.cfpush.net/api/v0/available_products -F 'product[file]=@/home/ubuntu/cf-2-small.pivotal'

