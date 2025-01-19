create_gitlab_project() {
	gitlab-rails runner "project = Project.create( name: 'bonus_project', path: 'bonus_project', creator_id: 1, visibility_level: 20, namespace_id: 1, organization_id: 1); project.save!; project.create_repository()"
}

push_project() {
	git clone http://root:password123456@localhost/root/bonus_project.git
	cp /mnt/bonus/wil-app/*.yaml bonus_project
	cd bonus_project || (echo "Error: bonus_project wasn't cloned successfully, exiting..." && exit 1)
	git config user.name "admin"
	git config user.email "gitlabadmin@example.com"
	git add .
	git commit -m "first commit"
	git push -u origin main
	cd ..
	rm -rf bonus_project
}

(create_gitlab_project)
(push_project)
