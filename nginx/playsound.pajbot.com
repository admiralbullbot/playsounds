server {
	listen 80;
	listen [::]:80;

    server_name playsound.pajbot.com;

	root /srv/www/playsound/files;

	location /imports {
        root /srv/www/playsound;
        autoindex on;
		try_files $uri $uri/ =404;
	}

	location / {
        expires 30d;
        add_header Vary Accept-Encoding;
        autoindex on;
		try_files $uri $uri/ =404;
	}
}
