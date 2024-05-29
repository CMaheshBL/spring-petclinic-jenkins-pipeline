pipeline {
  environment {
    registry = "cmaheshbl/spring-petclinic-hub"
    registryCredential = 'dockercred'
    dockerImage = ''
  }
  agent any
  tools {
      jdk 'jdk17'
      maven 'maven_home'
  } 
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/CMaheshBL/spring-petclinic-jenkins-pipeline.git'
      }
    }
    stage('Compile') {
       steps {
         bat 'mvn compile' //only compilation of the code
       }
    }

    stage("Docker Build & Push"){
       steps{
          script{
            withDockerRegistry(credentialsId: 'dockercred', toolName: 'docker') {
                 bat "docker build -t cmaheshbl/spring-petclinic-hub ."
                 bat "docker tag cmaheshbl/spring-petclinic-hub cmaheshbl/spring-petclinic-hub:latest "
                 bat "docker push cmaheshbl/spring-petclinic-hub:latest "
        
            }
         }
      }
    }
    
   // stage('Test') {
   //  steps {
    //    bat '''
    //    mvn clean install
    //    ls
    //    pwd
    //    ''' 
        //if the code is compiled, we test and package it in its distributable format; run IT and store in local repository
    //  }
    //}
   /* stage('Building Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        bat "docker rmi $registry:latest"
      }
    }
    */
  }
}
