# Build docker image
`docker build -t odoo_docker .`

# Allow remote access to postgres
1. Change in postresql.conf file
    `sudo nano /etc/postgresql/{postgres_version}/main/postgresql.conf`

    - Change this line 
        `#listen_addresses = 'localhost'`
        to
        `listen_addresses = '*'`

2. Change in pg_hba.conf
    `sudo nano /etc/postgresql/{postgres_version}/main/pg_hba.conf`

    - Change this line 
    `host all all 127.0.0.1/32 md5`
    to 
    `host all all 0.0.0.0/0 md5`

3. Allow firewall to use the port
    `sudo ufw allow 5432/tcp`

4. Restart postgresql service
    `sudo systemctl restart postgresql`


