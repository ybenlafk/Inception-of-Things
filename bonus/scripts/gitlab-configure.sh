create_gitlab_project() {
	gitlab-rails runner "project = Project.create( name: 'samini_bonus_project', path: 'samini_bonus_project', creator_id: 1, visibility_level: 20, namespace_id: 1, organization_id: 1); project.save!; project.create_repository()"
}

push_project() {
	git clone http://root:password123456@localhost/root/samini_bonus_project.git
	cp /mnt/bonus/wil-app/*.yaml samini_bonus_project
	cd samini_bonus_project || (echo "Error: samini_bonus_project wasn't cloned successfully, exiting..." && exit 1)
	git config user.name "admin"
	git config user.email "gitlabadmin@example.com"
	git add .
	git commit -m "first commit"
	git push -u origin main
	cd ..
	rm -rf samini_bonus_project
}

(create_gitlab_project)
(push_project)
