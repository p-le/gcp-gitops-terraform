#!/bin/bash

sudo apt-get update
sudo apt-get install apache2 -y
echo '<html><body><h1>Environment: ${environment}</h1></body></html>' | sudo tee /var/www/html/index.html
