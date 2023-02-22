apt-get update
wget -O w7x64.img https://bit.ly/akuhnetw7X64
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
./ngrok authtoken 1pRvfePyCgaa2xZw3Wk4VxOANxA_5KEgrVHxaV9XohEnzDe3S
nohup ./ngrok tcp 3388 &>/dev/null &
apt-get install qemu-system-x86 -y
qemu-system-x86_64 -hda w7x64.img -m 4G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sleep 432000