#FORM  instruction  specifies the base image that i'm building 
# styntaxe Base_image[:tag]  tha name of the base image to use typically comes from the docker hub 
# tags  (optional) this refers to specific version or variant of the base image 
#
FROM debian:buster

#FROM NGNIX:latest

# RUN is usefull to execute a commands during the image build process 
# in this case i'm installing ngnix and openssl 
#open-source software library that provides cryptographic function and tools it's used for secure communication over computer networks
#encryption , digital signature 
#ssl : secure socket layer , tls :transport layer security 
RUN apt-get update && \
    apt-get install nginx -y && \
    apt-get install openssl -y

# COPY <SRC> specifies the path to the file or directory on the host amchine 
# <DEST> specifies the path within the container
COPY conf/ /etc/nginx/conf.d/

#why u creating this ?
#When setting up HTTPS (SSL/TLS) for your Nginx server, 
#you'll need SSL certificates and keys to secure the communication between clients and your server.
# The /etc/nginx/ssl directory is commonly used to store these SSL certificates and keys within your Docker container.
RUN mkdir /etc/nginx/ssl

#The working directory in a Docker container is the directory where your command will be executed when the container starts.
# It's like the current directory in your terminal or command prompt, 
#but within the context of the container.
WORKDIR /etc/nginx/ssl


#req to initiates a certificate request , -newkey rsa:4096 [algorith:size] generate a new private key using the RSA with key size 2048 bits
# -x509 creat a self-signed certificate -sha256 specifies the message digest 
# -day spesifique validity days 
# -nodes 
# -out specifies the path where the generated certificate will saved
# - keyout  .. private key will saved
# -subj specifies the subject of the certificate c=country , st= state, l=localy, o organisation , OU organizational unit , CN common name
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out jchennak_cert.crt \
    -keyout jchennak_private.key \
    -subj "/C=MA/ST=Bng/L=Bng/O=42 School/OU=jchennak/CN=jchennak/"

# is used to specify which ports should be made availble for networking between a docker container and host machine 
EXPOSE 443 
#try to connect containers between others with this commande :D


#The CMD instruction in a Dockerfile specifies the default command that should be executed when a container based on the image is launched. 
#This command is the main process that runs within the container.
CMD ["nginx", "-g", "daemen off;"]
#-g: This flag indicates that you are passing a global configuration option to Nginx.

#There can only be one CMD instruction in a Dockerfile. 
#If you list more than one CMD then only the last CMD will take effect.
#"Hey, when you start up, please run Nginx and don't go to the background."
#- **Daemon**:
#   - Explanation: Daemons are like helpful assistants that handle tasks behind the scenes, such as serving websites, managing printers, or checking for updates. They run continuously without needing constant attention from users.

#we can do all this works without a docker file ?
#yes juat with commandes as docker pull ngnix:latest