#! /bin/bash
docker stop compiler
docker rm compiler
docker rmi compiler
docker build -f Dockerfile -t compiler . --network=host
docker run -p 8081:8081 --restart=always --name=compiler -v $(pwd):/docs compiler
