def clone_repo(repo_name, branch_name){
   sh'''
   git clone -b ${branch_name} https://github.com/vegito11/${repo_name}.git
   pwd
   ls
   '''
}

def set_variables(){
   env.BRANCH_NAME = "main"
   env.REPO_NAME   = "spring-petclinic"
}

node(){
   
   set_variables()
   
   stage("Clone code repo"){
      clone_repo(BRANCH_NAME, REPO_NAME)
   }
}
