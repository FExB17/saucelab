import os
import pathlib
import yaml

_REQUIRED_KEYS = [
    "BASE_URL",
    "BROWSER",
    "HEADLESS",
    "STANDARD_USER",
    "PASSWORD",
    "LOCKED_OUT_USER",
    "INVALID_USER",
    "INVALID_PASSWORD",
]

def _to_bool(val: str):
    return str(val).strip().lower() in ("1", "true", "yes", "on")

# 1) ENV lesen
env = {k: os.getenv(k) for k in _REQUIRED_KEYS}

# 2) qa.yaml lesen (falls vorhanden)
file_vals = {}
p = pathlib.Path(__file__).with_name("qa.yaml")
if p.exists():
    with open(p, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f) or {}
    file_vals = {k: data.get(k) for k in _REQUIRED_KEYS}

def _pick(key: str, cast_bool: bool = False):
    val = env.get(key)
    if val in (None, ""):
        val = file_vals.get(key)
    if val in (None, ""):
        raise ValueError(
            f"[variables/env_or_file.py] Required variable '{key}' is missing. "
            f"Provide it via ENV or variables/qa.yaml."
        )
    if cast_bool:
        return _to_bool(val)
    return val

# Exportierte Robot-Variablen
BASE_URL         = _pick("BASE_URL")
BROWSER          = _pick("BROWSER")
HEADLESS         = _pick("HEADLESS", cast_bool=True)
STANDARD_USER    = _pick("STANDARD_USER")
PASSWORD         = _pick("PASSWORD")
LOCKED_OUT_USER  = _pick("LOCKED_OUT_USER")
INVALID_USER     = _pick("INVALID_USER")
INVALID_PASSWORD = _pick("INVALID_PASSWORD")
