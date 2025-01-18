create_gitlab_token() {
	sudo gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: ['api'], name: 'bonus_token', expires_at: 365.days.from_now); token.set_token('bonus_pass'); token.save!"
}

create_gitlab_project() {
	source .venv/bin/activate
	echo "python-gitlab==5.3.1" > requirements.txt
	pip install -r requirements.txt
	rm requirements.txt
	python create-project.py
	python 'import gitlab;URL="http://localhost";gl=gitlab.Gitlab(URL, private_token="bonus_pass");print(gl.http_post("/projects", post_data={"name":"bonus_project","visibility":"public"}))'
}

push_project() {
	git clone http://root:bonus_pass@localhost/root/bonus_project.git
	cp ../config/wil-app/*.yaml bonus_project
	cd bonus_project
	git config user.name "admin"
	git config user.email "gitlabadmin@example.com"
	git add .
	git commit -m "first commit"
	git push -u origin main
	rm -rf bonus_project
}

(create_gitlab_token)
(create_gitlab_project)
(push_project)
