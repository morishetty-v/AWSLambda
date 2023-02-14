# AWSLambda
How to make custom runtime environments in AWS Lambda

### 1. Create a Dockerfile with a custom runtime environment ###

A Container Image is a Dockerfile that contains all the information necessary to creating your own runtime environment. It has all the files and packages needed to be installed. Looking at the Dockerfile in this repo we can see that we have used the alpine linux distribuition where we can begin to create our environment. We first start by setting our environement variables such as Bash versions. Next, we use the RUN command to install all the neccary packages to use bash via wget. Finally, we copy the docker-entrypint.sh file to the /usr/local/bin/, set the entrypoint to that file and run bash. Thus, our environment is created.

### 2. Create a repo in AWS ECR (Elastic Container Registry) ###
![image](https://user-images.githubusercontent.com/78062994/218638005-c9f4fd7e-73cc-4698-868e-7b5eb6072c0c.png)

Once you create your repo, go into you CMD and run the following docker commands to push your docker image to the ECR repository. This allows AWS to see your custom runtime environment so you can add it to Lambda.
```bash
sudo docker login -u AWS -p $(aws ecr get-login-password --region your-region) aws-account-id.dkr.ecr.your-region.amazonaws.com

sudo docker build -t your-ecr-repo-name .

sudo docker tag your-ecr-repo-name:latest aws-account-id.dkr.ecr.your-region.amazonaws.com/your-ecr-repo-name:latest

sudo docker push aws-account-id.dkr.ecr.your-region.amazonaws.com/your-ecr-repo-name:latest
```

### 3. Create a Function in Lambda ###
![image](https://user-images.githubusercontent.com/78062994/218636594-14c8fc27-1783-4767-974c-b59e1bfd0f89.png)

Finally, we can create our custom runtime environment in Lambda. Select the Container Image option and navigate to the ECR repository you created to select the Image you uploaded. Once the function has been made, you can now run any bash scripts through Lambda. You can create any runtime environment in a Docker Image and follow these steps.
