# See what’s running and where errors are
docker compose ps
docker compose logs --since=10m gameboard_agent demo_agent_1 demo_agent_2

# Optional: snapshot logs & ledgers before any cleanup
mkdir -p backups/$(date +%Y%m%d-%H%M%S)
docker run --rm -v logs-gameboard:/v -v "$(pwd)/backups/$(date +%Y%m%d-%H%M%S)":/b alpine \
  sh -c 'cp -a /v /b/gameboard_logs'
docker run --rm -v logs-demo1:/v -v "$(pwd)/backups/$(date +%Y%m%d-%H%M%S)":/b alpine \
  sh -c 'cp -a /v /b/demo1_logs'
docker run --rm -v logs-demo2:/v -v "$(pwd)/backups/$(date +%Y%m%d-%H%M%S)":/b alpine \
  sh -c 'cp -a /v /b/demo2_logs'
