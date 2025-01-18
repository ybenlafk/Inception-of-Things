create_gitlab_project() {
	sudo gitlab-rails runner "project = Project.create( name: 'bonus_project', path: 'bonus_project', creator_id: user.id, visibility_level: 20, namespace_id: 1, organization_id: 1); project.save!"
}

push_project() {
	git clone http://root:password123456@localhost/root/bonus_project.git
	cp /mnt/bonus/wil-app/*.yaml bonus_project
	cd bonus_project
	git config user.name "admin"
	git config user.email "gitlabadmin@example.com"
	git add .
	git commit -m "first commit"
	git push -u origin main
	rm -rf bonus_project
}

(create_gitlab_project)
(push_project)
