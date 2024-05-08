#!/usr/bin/env bash

docker image build --progress=plain --rm --pull -f Dockerfile -t ejbarker-swivel:latest .