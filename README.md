# Monitor Client
Client to send usage data do **Monior API**
### Create RPM
```
./build_rpm.sh
```
### Deploy
```sudo rpm -i  monitor_client-1.0.0-1.noarch.rpm```
### Running
```sudo service monitor_client_server start```
### Test
```bundle exec rspec```
