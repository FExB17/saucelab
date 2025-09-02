import os
import yaml
from dotenv import load_dotenv
from pathlib import Path

# Load .env for local runs
env_path = Path(__file__).parents[1] / ".env"
if env_path.exists():
    load_dotenv(env_path)

# Load qa.yaml for config
yaml_path = Path(__file__).parent / "qa.yaml"
yaml_vars = {}
if yaml_path.exists():
    with open(yaml_path) as f:
        yaml_vars = yaml.safe_load(f)

def get_var(name, default=None, required=False):
    v = os.getenv(name) or yaml_vars.get(name) or default
    if required and v is None:
        raise RuntimeError(f"Missing required variable: {name}")
    return v

# Export variables for Robot
BROWSER = get_var("BROWSER", default="chromium")
HEADLESS = get_var("HEADLESS")
BASE_URL = get_var("BASE_URL", required=True)
STANDARD_USER = get_var("STANDARD_USER", required=True)
PASSWORD = get_var("PASSWORD", required=True)
LOCKED_OUT_USER = get_var("LOCKED_OUT_USER", required=True)
INVALID_USER = get_var("INVALID_USER", required=True)
INVALID_PASSWORD = get_var("INVALID_PASSWORD", required=True)