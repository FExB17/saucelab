set -euo pipefail

robot \
  -V variables/qa.yaml \
  -V variables/secrets.py \
  -d reports \
  tests/