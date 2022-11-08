Kibana server - details

Type: t3.medium
EBS Volume size: 50GB
Subnet: public
Instance profile: <Created in IAM role for SSM ticket>


sudo apt-get install kibana

To make the configuration changes open the kibana.yml configuration file and uncomment the following lines:
server.port: 5601
server.host: "localhost"
elasticsearch.hosts: ["http://localhost:9200"]

sudo systemctl start kibana
sudo systemctl enable kibana

# use the Apache server as your proxy server, allowing the Kibana Dashboard to be viewed on Port 80
apache

# Create the configuration file named domain.conf in 
# /etc/apache2/sites-available/domain.conf 
<VirtualHost *:80>
    ServerName localhost
    ProxyRequests Off
    ProxyPreserveHost On
    ProxyVia Full
    <Proxy *>
        Require all granted
    </Proxy>
    ProxyPass / http://127.0.0.1:5601/
    ProxyPassReverse / http://127.0.0.1:5601/
</VirtualHost>

#run the below commands so that apache works as proxy server 
sudo a2dissite 000-default
sudo a2enmod proxy proxy_http rewrite headers expires
sudo a2ensite domain.conf
sudo service apache2 restart
