# run with sh
# e.g. 'sh ssh-keygen.sh'

cd ~

# generate ssh if doesnt exist
if ! [ -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "briankim53@gmail.com"
fi

# then cat
cat ~/.ssh/id_ed25519.pub
echo '-- add public key to github account --'
read -p "press enter to continue"


# test ssh
RESULT=`ssh -T git@github.com 2>&1`
echo "$RESULT"
# if connection successful, clone latex and wiki repo
if [[ $RESULT == *"successfully"* ]]; then
    mkdir -p ~/Documents && cd ~/Documents

    if ! [ -d ~/Documents/latex ]; then
        git clone git@github.com:brianfabre/latex.git
        echo 'successfully cloned latex repo'
    else
        echo 'failed to clone latex repo: directory already exists'
    fi

    if ! [ -d ~/Documents/wiki ]; then
        git clone git@github.com:brianfabre/wiki.git
        echo 'successfully cloned wiki repo'
    else
        echo 'failed to clone wiki repo: directory already exists'
    fi

else
    echo 'exiting script'
    exit 1
fi
