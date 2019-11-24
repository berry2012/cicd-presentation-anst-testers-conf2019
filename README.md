# Source Code for my presentation at ANST 2019 Testers Conference
## Theme: Quality, a collective responsibility

## Presentation - Integrating test plans in a CI/CD Pipeline - with Demo

### Setting up this CI/CD demo project
* step 1 - provision servers (staging and production) using Infrastructure as Code with CloudFormation
* step 2 - stage 1 source version control with CodeCommit
* step 3 - stage 2 test with CodeBuild
* step 4 - create central storage to store artifacts with AWS S3
* step 5 - stage 3 deploy with CodeDeploy
* step 6 - pipeline orchestration with AWS CodePipeline - use
     * 6a - pipeline without Testing (2 stages)
     * 6b - pipeline with Testing (3 stages)

![The Reference Architecture](/Users/olawale/Dropbox/waleworks/DevOps/AWSDevOpsExamPrep/code/testers-conf-cicd-demo/anst2019conference/refarchitecture.png)

![Pipeline Architecture - without Testing stage](/Users/olawale/Dropbox/waleworks/DevOps/AWSDevOpsExamPrep/code/testers-conf-cicd-demo/anst2019conference/refarchitecture.png)

![Pipeline Architecture - with Testing stage](/Users/olawale/Dropbox/waleworks/DevOps/AWSDevOpsExamPrep/code/testers-conf-cicd-demo/anst2019conference/refarchitecture.png)

![Pipeline results](/Users/olawale/Dropbox/waleworks/DevOps/AWSDevOpsExamPrep/code/testers-conf-cicd-demo/anst2019conference/refarchitecture.png)


## Demo Summary
[Youtube Video Link to Summary of this tutorial](https://youtu.be/kKxotUFOwCY) 
Remember to subscribe to my channel

## step by step tutorial for the Demo - No Audio
[Link to the step by step video of this tutorial](https://www.youtube.com/playlist?list=PLyztPX_5xCL75TnVBrayPyGnF_mHSsuDP)


## manually confirm CodeDeploy agent is running on EC2
ssh ec2-user@<pulicIP of instance> -i ~/path/to/your/sshkey
sudo service codedeploy-agent status


#### CodePipeline & CodeBuild needs a central storage to store all artifacts. The codes below will create a bucket and enable versioning

```
aws s3 mb s3://anst-demo --region eu-west-1  --profile profilename
aws s3api put-bucket-versioning --bucket anst-demo --versioning-configuration Status=Enabled --region eu-west-1 --profile profilename

```

#### deploy the files into S3 - run this from within the directory that contains appspec.yaml file

aws deploy push --application-name anst-webapp --s3-location s3://anst-demo/codedeployinitialrevision/anst.zip --ignore-hidden-files --region eu-west-1 --profile profilename


