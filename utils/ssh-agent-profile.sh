# Setup ssh agent
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock
ssh-add -l 2>/dev/null >/dev/null
if [[ $? -ge 2 ]]; then
  if [[ -a $SSH_AUTH_SOCK ]] then
    rm $SSH_AUTH_SOCK
  fi
  ssh-agent -a $SSH_AUTH_SOCK >/dev/null
fi
add_key_if_not_exist(){
      ssh-add -l | grep "$(ssh-keygen -lf $1 | head -c 20)" -q || ssh-add $1 2>/dev/null
}
if [[ -a ~/.ssh/gh_vabalops_nucbox ]] then
      add_key_if_not_exist ~/.ssh/gh_vabalops_nucbox
      add_key_if_not_exist ~/.ssh/id_rsa
fi
