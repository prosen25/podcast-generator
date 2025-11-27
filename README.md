# podcast-generator

This action generates a podcast XML feed from a YAML file.

Quick notes about the Docker image / build failure fix

- The GitHub Action was failing during build because the Ubuntu base image prevents pip from installing packages system-wide (PEP 668 / "externally-managed-environment").
- This repository's `Dockerfile` now uses the official `python:3.11-slim` base which allows `pip install` to work inside the image.

Build & test locally

```bash
# from workspace root
docker build -t podcast-generator:local -f Dockerfile .

# check PyYAML is installed in the image
docker run --rm --entrypoint python3 podcast-generator:local -c "import yaml; print('PyYAML', yaml.__version__)"
```

If you still see a build error in GitHub Actions, make sure you are building the repository's Dockerfile (the action uses `runs.using: Docker`).