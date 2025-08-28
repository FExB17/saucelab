import os
import yaml

# Load qa.yaml once, if needed
def load_yaml_vars():
    yaml_path = os.path.join(os.path.dirname(__file__), "qa.yaml")
    if os.path.exists(yaml_path):
        with open(yaml_path, "r") as f:
            return yaml.safe_load(f)
    return {}

_YAML_VARS = None

def get_any(*names, default=None, required=False):
    # Try environment variables first
    for n in names:
        v = os.getenv(n)
        if v not in (None, ""):
            return v
    # Fallback to YAML
    global _YAML_VARS
    if _YAML_VARS is None:
        _YAML_VARS = load_yaml_vars()
    for n in names:
        v = _YAML_VARS.get(n)
        if v not in (None, ""):
            return v
    if required and default is None:
        raise RuntimeError(f"Missing required var (tried): {', '.join(names)}")
    return default

# Browser/Run
BROWSER  = get_any("BROWSER", default="chromium")
HEADLESS = str(get_any("HEADLESS", default="true")).lower() == "true"

# App / Credentials (alias-tolerant)
BASE_URL          = get_any("BASE_URL", required=True)
STANDARD_USER     = get_any("STANDARD_USER", required=True)
PASSWORD          = get_any("PASSWORD", required=True)
LOCKED_OUT_USER   = get_any("LOCKED_OUT_USER", required=True)
INVALID_USER      = get_any("INVALID_USER", required=True)
INVALID_PASSWORD  = get_any("INVALID_PASSWORD", required=True)
