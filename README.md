# CloudProject_Phase3Finalization
The final complete project.

## 1. Desription

This project deploys a simple html hello page website on AWS using Terraform. 
### Requirments:
- Installation of Terraform, AWS account and desired IDE (Instructions for Pycharm below or Github).
- Terraform ~> 5.0

## 2. Instruction for installation,cofiguration and usage

### Step 1. Installation
(For this project any IDE is required. I chose Pycharm specifically because I'm familiar with it and the interface is easy to use, therefore I also installed Python. I later uploaded the files on Github, which can also be used to run and test the code. However the below instructions are for Pycharm installation of Terraform but they can work in any terminal window )
#### Create an account on Github:
- https://youtu.be/Gn3w1UvTx0A?si=XhUdL2F6I4tXbt7y
- Install Python using this link:
https://www.python.org/downloads/
- Install Pycharm using this link:
https://www.jetbrains.com/pycharm/
- Add Pycharm to the path. Log into or create an account. Create a new project or download the project folder. 
- Install Terraform using this link:
https://developer.hashicorp.com/terraform/install
Extract all files and click on the set up folder. 

If there are any problems with Installing Terraform paste these commands into the Pycharm terminal or Powershell:
- curl -o terraform.zip https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_windows_amd64.zip

Then,

- Expand-Archive terraform.zip -DestinationPath .\terraform

Then,

- .\terraform\terraform.exe -version

- Install and configure AWS
- Start-Process msiexec.exe -Wait -ArgumentList '/i', "$env:USERPROFILE\Downloads\AWSCLIV2.msi", '/qn'

Install AWS using this link:
https://awscli.amazonaws.com/AWSCLIV2.msi

And,

- aws --version

### Step 2. Place the code
- Make sure Pycharm accepts files ending in ".tf"

Go to "file" and search for "settings".

Under "Editor", tap on "Plugins" and on the search bar look for Terraform. Install it and when the installation is completed, click on OK and then apply.
- Download the required files into Pycharm.
- Add Terraform to path

### Step 3. Configuration
- Navigate your project folder. In my example it's cd C:\Users\Nikol\PycharmProjects\PythonProject
- paste these commands into the Pycharm terminal. 

 #### terraform init

- Log into your AWS account or create an account.
https://youtu.be/kfxhfAq8PNY?si=J6d8EEEZQ0eUVIdO

- Create access key and a secret key.
https://youtu.be/I7gPrvD3GSQ?si=1FG-x-gjXQZ7xpGH

- Run: aws configure

- In the terminal type manually your AWS credentials. Chose a region of choice, in my case it's eu-central-1 (Frankfurt).

#### terraform plan

After these commands you should see something like this  in the terminal window. 

 "Plan: 4 to add, 0 to change, 0 to destroy."

#### terraform apply




### Step 4. See the website 
On the termianla window below outputs, a link directly to the website will be attached. The website could also be accesses throught the AWS console. 


## 4. References
GitHub account
https://youtu.be/Gn3w1UvTx0A?si=XhUdL2F6I4tXbt7y

Python download page
https://www.python.org/downloads/

PyCharm download page
https://www.jetbrains.com/pycharm/

Terraform installation page
https://developer.hashicorp.com/terraform/install

Terraform direct download (zip)
https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_windows_amd64.zip

AWS CLI download
https://awscli.amazonaws.com/AWSCLIV2.msi

AWS login / account creation tutorial (YouTube)
https://youtu.be/kfxhfAq8PNY?si=J6d8EEEZQ0eUVIdO

AWS access key and secret key tutorial (YouTube)
https://youtu.be/I7gPrvD3GSQ?si=1FG-x-gjXQZ7xpGHcd 