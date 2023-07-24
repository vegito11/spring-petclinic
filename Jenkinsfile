def clone_repo(repo_name, branch_name){
   
   stage("Clone code repo"){
      sh"""
      git clone -b ${branch_name} https://github.com/vegito11/${repo_name}.git
      """
   }
}

def build_push_docker_img(){
  
  stage("build docker image ${IMAGE_NAME}"){
   
     sh'''
     cd ${REPO_NAME}
     docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
     '''
  }

  stage("push image to dockerhub"){
     
     withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
        
        sh'''
        docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
        docker push ${IMAGE_NAME}:${IMAGE_TAG}
        '''
     }

  }
}

def deploy_app(){

   stage("deploying app ${IMAGE_NAME}"){
      sh"""
      cd ${REPO_NAME}
      docker-compose up -d
      """
   }
}


def set_variables(){
   env.BRANCH_NAME = "main"
   env.REPO_NAME   = "spring-petclinic"
   env.IMAGE_NAME  = "vegito/petclinic"
   env.IMAGE_TAG   = "main-1.0.0"
}

node(){
   cleanWs()
   set_variables()
   clone_repo(REPO_NAME, BRANCH_NAME)
   build_push_docker_img()
   deploy_app()
}
