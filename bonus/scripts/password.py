def get_password():
    with open("/etc/gitlab/initial_root_password") as file:
        [password_line] = [l.strip() for l in file.readlines() if "Password: " in l]
        [_, password] = password_line.split()
        print(password)

username = "root"
password = get_password()
