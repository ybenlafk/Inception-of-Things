import gitlab

URL = 'http://localhost'

gl = gitlab.Gitlab(URL, private_token="bonus_pass")
print(gl.http_post("/projects", post_data={"name": "bonus_project", "visibility": "public"}))
