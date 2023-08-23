server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root {{ lighthouse_dir }};

	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}
}
