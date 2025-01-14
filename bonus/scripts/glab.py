import bs4
import gitlab
import re
import requests
import sys

assert len(sys.argv) > 1, "please provide the password"
password = sys.argv[1]
URL = 'http://localhost'
SIGN_IN_URL = f"{URL}/users/sign_in"
LOGIN_URL = f"{URL}/users/sign_in"

session = requests.Session()

sign_in_page = session.get(SIGN_IN_URL).content
for l in sign_in_page.decode().split('\n'):
    m = re.search('name="authenticity_token" value="([^"]+)"', l)
    if m:
        break

token = None
if m:
    token = m.group(1)

if not token:
    print('Unable to find the authenticity token')
    sys.exit(1)

data = {'user[login]': 'root',
        'user[password]': password,
        'authenticity_token': token}
r = session.post(LOGIN_URL, data=data)
if r.status_code != 200:
    print('Failed to log in')
    sys.exit(1)

gl = gitlab.Gitlab(URL, api_version=4, session=session)
# print(gl.user)
# print(gl.http_get("/projects"))

#response = session.post(f"{URL}/api/v4/profile/personal_access_tokens", data={"name": "REPO TOKEN", "scopes": ["api"], "expires_at": "2026-1-13" })
page_tokens = session.get(f"{URL}/profile/personal_access_tokens)")
root = bs4.BeautifulSoup(page_tokens.text, "html5lib")
token = root.find_all("form", id='new_personal_access_token')[0].find_all('input', attrs={'name': 'authenticity_token'})[0]['value']
body = {
        "personal_access_token[name]": "repotoken",
        "personal_access_token[scopes][]": "api",
        "authenticity_token": token
        }

response = session.post(f"{URL}/profile/personal_access_tokens", data=body)
print(response.text)
print(f"response: {response}")
