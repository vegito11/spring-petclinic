def clone_repo(repo_name, branch_name){
   
   stage("Clone code repo"){
      sh'''
      git clone -b ${branch_name} https://github.com/vegito11/${repo_name}.git
      pwd
      ls
      '''
   }
}

def build_push_docker_img(){
  
  stage("build docker image ${IMAGE_NAME}"){
   
     sh'''
     cd ${REPO_NAME}
     sudo docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
     '''
  }
}


def set_variables(){
   env.BRANCH_NAME = "main"
   env.REPO_NAME   = "spring-petclinic"
   env.IMAGE_NAME  = "vegito11/petclinic"
   env.IMAGE_TAG   = "main-1.0.0"
}

node(){
   set_variables()
   clone_repo(BRANCH_NAME, REPO_NAME)
   build_push_docker_img()
}
