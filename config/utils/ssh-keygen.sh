# run with sh
# e.g. 'sh ssh-keygen.sh'

cd ~

# generate ssh if doesnt exist
if ! [ -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "briankim53@gmail.com"
fi

# then cat
cat ~/.ssh/id_ed25519.pub

# test ssh
echo 'type "ssh -T git@github.com" to test after adding pub key to github'
