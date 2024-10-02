# Getting Started
This is a starter repo that includes a Docker Compose file that builds the following Docker containers:
- A MySQL server with some tables created and test data initialized.
- Python API with one working endpoint
- phpMyAdmin for connecting to the MySQL server to retrieve data.
- A Vite development web server that hosts a Preact app calling a single endpoint from the Python API, configured for hot reloading.

# Accessing the Services
- phpMyAdmin: Open `http://localhost:8080` in your browser
- API: Access `http://localhost:5001/api/contacts`
- Frontend: Open `http://localhost:3000` in your browser

# Environment files:
- create .env file in ui/chemquote-ui should contain this line: VITE_API_BASE_URL=http://localhost:5001/ 
- create .ent file in infrastructure folder should have the following:
    DB_HOST=cq-db-host
    DB_USER=cqadministrator
    DB_PASSWORD=yourpassword
    DB_NAME=chemquote
    MYSQL_ROOT_PASSWORD=somethingreallylongtokeepitsecure
    PMA_USER=user #phpmyadmin_poweruser  # PhpMyAdmin username
    PMA_PASSWORD=makethislongtoobutdoesntneedtomatchabove # PhpMyAdmin password
    FLASK_DEBUG=1
    COMPOSE_PROJECT_NAME=chemquote
    VITE_API_BASE_URL=http://localhost:5001

# How to get things up and running
Navigate to the infrastructure folder and run the following command
docker-compose up --build 

## License
This project is licensed under the MIT License. See the [LICENSE](https://en.wikipedia.org/wiki/MIT_License) file for details.
