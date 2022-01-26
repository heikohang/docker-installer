# Updates sources
sudo apt-get update

# Installs Docker
OUTPUT=$(lsb_release -si)
if echo $OUTPUT | grep -q "Debian"
then
	OS="debian"
elif echo $OUTPUT | grep -q "Ubuntu"
then
	OS="ubuntu"
else
	echo "Not a Debian or Ubuntu OS"
	exit 1
fi

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/${OS}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/${OS} \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
