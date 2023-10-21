# Resolves Python 3.8+ dependency.
FROM node:16-bullseye

RUN apt-get update && apt-get install -y lsb-release sudo

ENTRYPOINT ./compile-headless.sh
