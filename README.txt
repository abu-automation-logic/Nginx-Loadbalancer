*** Steps to replicate the solution ***

Pre-requisite: Make sure you have vagrant and a provider like VirtualBox installed

Unzip attached AutomationLogic.zip it will create a folder named "AutomationLogic"
Go to the folder and run below command. This will start 3 VMs; load_balancer, web_server1 and web_server2

vagrant up

Once completed successfully a confirmation message will also display showing Nginx is running on all 3 VMs. 
You can login to the hosts via below command;

vagrant ssh [load_balancer|web_server1|web_server2]

** Testing **

You can test Nginx is load balancing the traffic by accessing the webservers via below link in the browser;

http://10.11.12.60/

refresh the page multiple times and you will see latest temperature from London and Amsterdam

or via curl command;

curl http://10.11.12.60/ 

or locally from load_balancer using 

curl localhost

Loadbalancer has been setup in its default Round Robin method. We can also change it to "sticky" based on the requirement. You only need to add "ip_hash;" in Nginx loadbalancer configuration in below block.
upstream web_backend {
        ip_hash;
        server 10.11.12.61;
        server 10.11.12.62;
    }


** Destruction **

After finish testing and verification use below to destroy all VMs;
vagrant destroy -f



*** Solution explanation ***

- Ansible is being used as configuration management tool. I used this because I have been using it in most recent role.
- Nginx is installed using Ansible role "install_nginx"
- Separate Ansible roles have been created for webservers and load balancers. This gives flexibility to manage the code
- Separate Ansible role has been created for sudoers access. Again, it makes it easy to manage the code without impacting others.
- Shell script is being used to call by Vagrant's shell provisioner to check if Nginx is running or not
- Followed Ansible best practices for directory and file structure


*** Improvements ***

1. I never worked with Vagrant and Nginx commercially so only have limited knowledge to share improvements. Not sure it's possible but maybe we can decrease the lines of code in Vagrant file but removing duplicate tasks. For example; installing Nginx and checking Nginx is running. Having said that, I must admit it was fun working with both Vagrant and Nginx
2. Get city name in the application from the user through textbox and pass that to api link.
3. Use country flags
4. Error handling. If the city doesn’t exist, a message is given to the user that the city doesn’t exist with openweathermap.
5. Make web application more real-time so it autodetects user's geographical location and upon approval show local weather stats
6. Use a website like https://www.site24x7.com/ for monitoring 

*** Number of hours  ***
I had some rough time recently. My Dad passed away hence I had to travel to Pakistan for more than a week. Hence I couldn't focus much and continuously on the solution. If I add all the hours I think I spent about 4-6 hours in total.