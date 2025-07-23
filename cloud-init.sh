#!/bin/bash

config(){
	cat
}<<EOF
python.ec2.ashwink.com.np {
	reverse_proxy localhost:5000
}
EOF

user_service(){
	cat
}<<EOF
[Unit]
Description=My python app
After=network.target

[Service]
WorkingDirectory=%h/python-jenkins-example
ExecStart=flask --app main run
Restart=always
RestartSec=5
ExecStopPost=git pull

[Install]
WantedBy=default.target
EOF

user_service > /etc/systemd/user/python.service

apt update
apt install -y python3-flask curl caddy

config > /etc/caddy/Caddyfile

sudo -Hu ubuntu bash <<EOF
cd
git clone "https://github.com/cheseo/python-jenkins-example";
systemctl --user enable --now python.service
loginctl enable-linger

# apparantly systemctl --user doesn't work here, so have to do this manually
mkdir -p ~/.config/systemd/user/default.target.wants/
ln -s /etc/xdg/systemd/user/python.service ~/.config/systemd/user/default.target.wants/
EOF


reboot
