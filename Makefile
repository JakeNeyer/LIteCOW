.PHONY: sandbox
sandbox:
	sudo docker build -t sandbox -f sandbox/Dockerfile .
	sudo docker run -d --privileged --network host -v /var/run/docker.sock:/var/run/docker.sock sandbox

.PHONY: cleanup
cleanup:
	sudo docker run -it --privileged --network host -v /var/run/docker.sock:/var/run/docker.sock sandbox kind delete cluster --name knative

dev-docs :
	docker run --rm -it --network=host -v ${PWD}:/icow-light --workdir /icow-light --entrypoint bash --name litecow-docs polinux/mkdocs scripts/mkdocs_startup.sh
