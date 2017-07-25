



Folder where data is store: /data
Config in: /config

Set the host folder linked to with: -v /somewhere/data:/data

Config file must be stored in this folder too.

Run:

nano docker-compose.yml
# Change default mysql account name and password
# Change volumes host paths
docker-compose up -d
http://node01:8000/
# Follow instruction

Stop:

docker-compose down

