pipeline {

    agent any

    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "10.0.0.145:8081"
	NEXUSPORT=8081
        NEXUS_REPOSITORY = "vprofile-release"
	NEXUS_REPOGRP_ID    = "vpro-maven-group"
        NEXUS_CREDENTIAL_ID = "nexus_login"
        ARTVERSION = "${env.BUILD_ID}"
        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages{
	    
// 	    stage('Git CheckOut'){
// 		    steps{
// 		       checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'WipeWorkspace']], userRemoteConfigs: [[url: 'https://github.com/vikash-kumar01/JAVA-Webapp-CI.git']]])
// 		    }
// 	    }

//         stage('UNIT TEST'){

//             steps {
//                 sh 'mvn test'
//             }
//         }

//         stage('INTEGRATION TEST'){

//             steps {
//                 sh 'mvn verify -DskipUnitTests'
//             }
//         }

//         stage('CODE ANALYSIS with SONARQUBE') {
	
//             environment {
//                 scannerHome = tool 'mysonarscanner4'
//             }

//             steps {
//                 withSonarQubeEnv('sonarserver') {
//                     sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
//                    -Dsonar.projectName=vprofile-repo \
//                    -Dsonar.projectVersion=1.0 \
//                    -Dsonar.sources=src/ \
//                    -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
//                    -Dsonar.junit.reportsPath=target/surefire-reports/ \
//                    -Dsonar.jacoco.reportsPath=target/jacoco.exec \
//                    -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
//                 }

//                 timeout(time: 10, unit: 'MINUTES') {
//                     waitForQualityGate abortPipeline: true
//                 }
//             }
//         }
	   
//         stage('BUILD'){

//             steps {
//                 sh 'mvn clean install -DskipTests'
//             }
//             post {
//                 success {
//                     echo 'Now Archiving...'
//                     archiveArtifacts artifacts: '**/target/*.war'
//                 }
//             }
//         }
	    
// 	stage('OWASP CHECK'){
// 		steps{

// 	        dependencyCheck additionalArguments: '--format JSON  --disableYarnAudit', odcInstallation: 'owasp-check'
//                 recordIssues(tools: [checkStyle(id: 'CheckStyle-Issues', pattern: 'target/checkstyle-result.xml'), owaspDependencyCheck(id: 'OWASP-issues', pattern: 'dependency-check-report.json')])
// 		}    
// 	    }

//         stage ('CODE ANALYSIS WITH CHECKSTYLE'){

//             steps {
//                 sh 'mvn checkstyle:checkstyle'
//             }
//             post {
//                 success {
//                     echo 'Generated Analysis Result'
//                 }
//             }
//         }


//         stage("Publish to Nexus Repository Manager") {

//             steps {
//                 script {
//                     pom = readMavenPom file: "pom.xml";
//                     filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
//                     echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
//                     artifactPath = filesByGlob[0].path;
//                     artifactExists = fileExists artifactPath;
//                     if(artifactExists) {
//                         echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version} ARTVERSION";
//                         nexusArtifactUploader(
//                                 nexusVersion: NEXUS_VERSION,
//                                 protocol: NEXUS_PROTOCOL,
//                                 nexusUrl: NEXUS_URL,
//                                 groupId: pom.groupId,
//                                 version: ARTVERSION,
//                                 repository: NEXUS_REPOSITORY,
//                                 credentialsId: NEXUS_CREDENTIAL_ID,
//                                 artifacts: [
//                                         [artifactId: pom.artifactId,
//                                          classifier: '',
//                                          file: artifactPath,
//                                          type: pom.packaging],
//                                         [artifactId: pom.artifactId,
//                                          classifier: '',
//                                          file: "pom.xml",
//                                          type: "pom"]
//                                 ]
//                         );
//                     }
//                     else {
//                         error "*** File: ${artifactPath}, could not be found";
//                     }
//                 }
//             }
//         }
        stage('Docker : App Image Building'){
              //cd scripts && chmod +x docker.sh && ./docker.sh
            steps{
                sh """
		
                cd Docker-files/app/multistage/
                docker build -t vikashashoke/vprofileapp:v1.$BUILD_ID . 
                docker image tag vikashashoke/vprofileapp:v1.$BUILD_ID vikashashoke/vprofileapp:latest 
                """
            }
        }

        stage('Docker : Image push to DockerHUB '){

            steps{
                
                withCredentials([string(credentialsId: 'dockerHub_passwd', variable: 'docker_cred')]) {
                sh """
                
                docker login -u vikashashoke -p ${docker_cred}
                echo pushing latest app images ...
                docker image push vikashashoke/vprofileapp:v1.$BUILD_ID 
                docker image push vikashashoke/vprofileapp:latest
		 echo 'docker local image removal'
		docker image rm vikashashoke/vprofileapp:v1.$BUILD_ID
                docker image rm vikashashoke/vprofileapp:latest
		
		"""
                            
            }
          }
        }     
     }
 }






