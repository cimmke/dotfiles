#!/bin/bash

# Create a directory and change into it
md() {
	mkdir -p "$@"
	cd "$@" || exit
}

# Remove stopped container
rm_stopped_container() {
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]];
	then
		docker rm "$name"
	fi
}

# Run the firefox container
docker_firefox() {
	rm_stopped_container firefox
	sudo docker run -d \
		--memory 2gb \
		--net host \
		-v /etc/localtime:/etc/localtime:ro \
		-v "${HOME}/Downloads:${HOME}/Downloads" \
		-v "${HOME}/.mozilla:${HOME}/.mozilla" \
		-v /dev/shm:/dev/shm \
		-e DISPLAY \
		--device /dev/dri \
		--device /dev/snd \
		--group-add audio \
		--name firefox \
		cimmke/firefox
}
