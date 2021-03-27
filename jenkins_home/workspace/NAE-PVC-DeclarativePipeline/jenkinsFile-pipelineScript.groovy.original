// this pipeline contains a few plugin dependencies you need to resolve on Jenkins:
// - sshCommand
// - ansiColor
// you also need to point Jenkins to Terraform (validated with 0.11.latest)
// you need to create a username/password credentials set that sshCommand will use
// that's about it - enjoy!

pipeline {
 agent any
 
 stages {
   stage('Git code checkout and dependencies install'){
     steps {
       dir('dev'){
         ansiColor('xterm'){
           git branch: 'master', url: 'https://github.com/soumukhe/jenkins-NAE-cicd-.git'
         }
       }
       dir('dev/ACI'){
           sh 'ansible-galaxy collection install -r galaxy_requirements.txt'
           sh 'pip3 install -r requirements.txt'
       }
     }
   }
 

    stage('Generate ACI Config') {
     steps {
         dir('dev/ACI'){
             ansiColor('xterm') {
                 fileOperations([fileDeleteOperation(
                     excludes: '',
                     includes: 'config.json'
                     )])
                 ansiblePlaybook(
                     playbook: './short_aci_demo.yaml',
                     inventory: './hosts',
                     extras: '--check -vvv',
                     colorized: true)
                    }

       }
     }
    }
    
    stage('Verify ACI Config') {
     steps {
         dir('dev/ACI'){
             ansiColor('xterm') {
                 ansiblePlaybook(
                     playbook: './nae_pcv.yaml',
                     inventory: './hosts',
                     extras: '-vvv',
                     colorized: true)
                    }

       }
     }
    }

    stage('Push ACI Config') {
     steps {
       dir('dev/ACI'){
             ansiColor('xterm') {
                 ansiblePlaybook(
                     playbook: './short_aci_demo.yaml',
                     inventory: './hosts',
                     extras: '-vvv',
                     colorized: true) 
                    }

       }
     }
    }
   
  }
}
