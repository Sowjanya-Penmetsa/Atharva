welcome_useragent.py file contains the code to display the welcome message.
requirements.txt file contains all the requirements for the app.
terraform folder contains the configuration file to create storage account to store the terraform state information and configuration file to create a web app in Azure
Under workflow folder I have created three yml files info follows:
storage.yml - Workflow to create a storage account in Azure on workflow dispatch event
web_app.yml - Workflow to create a Web app in Azure on workflow dispatch event
welcome_useragent.yml - Workflow to build the app, Build and push the docker image to github packages, deploy the image from github packages to web app in Azure on push and pull requests to Main branch. 
For the purpose of testing I have also added the workflow dispatch event to welcome_useragent.ym
main_lexiwebapp12.yml - Workflow created using the code generated using deployment center in Azure.( I want to remove this file in future now I am testing some stuff)
