pipeline {
  environment {
    registry = "tyitzhak/spring-petclinic-hub"
    registryCredential = 'docker-hub'
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
        git 'https://github.com/talitz/spring-petclinic-jenkins-pipeline.git'
      }
    }
    stage('Compile') {
       steps {
         bat 'mvn compile' //only compilation of the code
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
    stage('Building Image') {
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
  }
}
