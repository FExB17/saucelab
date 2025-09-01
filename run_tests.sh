set -euo pipefail

robot \
  -V variables/env_or_file.py \
  -d reports \
  tests/