git clone http://root:bonus_pass@localhost/root/bonus_project.git
cp ../config/*.yaml bonus_project
cd bonus_project
git config user.name "admin"
git config user.email "gitlabadmin@example.com"
git add .
git commit -m "first commit"
git push -u origin main
rm -rf bonus_project
