#! /bin/bash
docker stop compiler
docker rm compiler
docker rmi compiler
docker build -f Dockerfile -t compiler .
docker run -itp 8081:8081 --name=compiler -v $(pwd):/docs compiler