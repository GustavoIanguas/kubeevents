build:
	@docker build -t gustavoianguas/watch-webhook:1.0 .
	@docker push gustavoianguas/watch-webhook:1.0

run_local:
	@docker build -t gustavoianguas/watch-filter:latest .
	@echo "running image"
	@docker run gustavoianguas/watch-filter:latest