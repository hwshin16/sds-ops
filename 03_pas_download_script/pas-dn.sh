# 1. Accept license agreement
#
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Token bDFRn1EcD3Ly9AmrxdkN" -X POST https://network.pivotal.io/api/v2/products/elastic-runtime/releases/32638/eula_acceptance

# 2. Downalod PAS
wget --post-data="" --header="Authorization: Token bDFRn1EcD3Ly9AmrxdkN" https://network.pivotal.io/api/v2/products/elastic-runtime/releases/32638/product_files/63742/download -O "cf-2.pivotal"


# 3. Ops Manager Access Token 받기
#   주의 : Ops Manager URL은 본인 URL로 변경

curl -s -k -H 'Accept: application/json;charset=utf-8' -d 'grant_type=password' -d 'username=admin' -d 'password=admin' -u 'opsman:' https://pcf.sds61.cfpush.net/uaa/oauth/token

# 4. PAS binary upload
#   주의 : Authorization Header의 값을 3번에서 받은 Access Token 값으로 변경
#   주의 : Ops Manager URL은 본인 URL로 변경

curl -vv -H 'Authorization: bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImtleS0xIiwidHlwIjoiSldUIn0.eyJqdGkiOiIwNzUxMDZkMmUyYWE0ZDMyYWQ2NTliZTEwMjQ4NDU2NyIsInN1YiI6IjM2YTkzNGI2LWExNGItNDBlOC1iMzVhLWQ4YjJjNzdkNzJjZSIsInNjb3BlIjpbIm9wc21hbi5hZG1pbiIsInNjaW0ubWUiLCJjbGllbnRzLmFkbWluIiwidWFhLmFkbWluIl0sImNsaWVudF9pZCI6Im9wc21hbiIsImNpZCI6Im9wc21hbiIsImF6cCI6Im9wc21hbiIsImdyYW50X3R5cGUiOiJwYXNzd29yZCIsInVzZXJfaWQiOiIzNmE5MzRiNi1hMTRiLTQwZTgtYjM1YS1kOGIyYzc3ZDcyY2UiLCJvcmlnaW4iOiJ1YWEiLCJ1c2VyX25hbWUiOiJhZG1pbiIsImVtYWlsIjoiYWRtaW5AdGVzdC5vcmciLCJhdXRoX3RpbWUiOjE1MTczMTY0ODksInJldl9zaWciOiI3ZTdlYzEzMCIsImlhdCI6MTUxNzMxNjQ4OSwiZXhwIjoxNTE3MzU5Njg5LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwODAvdWFhL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiYXVkIjpbInNjaW0iLCJvcHNtYW4iLCJjbGllbnRzIiwidWFhIl19.mSWQ7r3K8CGf4gE7dYQlBPF-Dl5bz1SKgE8qzUFLtcaaxfXEL9zx6NQwCu4IPId7fn3dWyCy7eFAAsbw560me86uJklbdYj1flVARzz2GWTWwKwAarbZcJ5XCx0U2yqgnJW8lM-dkDt9_FpQr1HcMGnBIbQ-7MgzssidhqMnrC43MARhi_AqcSrnUUMWu9r3KceK8123F3zuGhnE3sS-bUA_WKLzJhtmDnugN9Z6mAJE5SgtthqZGqJwNTndkdZjtD337qskRJTjKY88xlkGrYwsxMg_84FtIrQjdW0fRSzxjm-9qWy3djJ9ppNCSrHRTaS9ggKkqN87FpkmxUUtxg' -k -X POST https://pcf.sds61.cfpush.net/api/v0/available_products -F 'product[file]=@/home/ubuntu/cf-2.pivotal'

