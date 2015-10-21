
# Usage: git_setup "user name" "email"

git config --global user.name $1
git config --global user.email $2
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global push.default simple

read -p "Generate SSH Key? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ssh-keygen -t rsa -C $2
    cat ~/.ssh/id_rsa.pub
fi


