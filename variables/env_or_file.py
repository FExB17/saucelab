import os

def get_any(*names, default=None, required=False):
    for n in names:
        v = os.getenv(n)
        if v not in (None, ""):
            return v
    if required and default is None:
        raise RuntimeError(f"Missing required env var (tried): {', '.join(names)}")
    return default

# Browser/Run
BROWSER  = get_any("BROWSER", default="chromium")
HEADLESS = get_any("HEADLESS", default="true").lower() == "true"

# App / Credentials (alias-tolerant)
BASE_URL          = get_any("BASE_URL", required=True)
STANDARD_USERNAME = get_any("STANDARD_USER", required=True)
PASSWORD          = get_any("PASSWORD", required=True)
LOCKED_OUT_USER   = get_any("LOCKED_OUT_USER", required=True)
INVALID_USER      = get_any("INVALID_USER", required=True)
INVALID_PASSWORD  = get_any("INVALID_PASSWORD", required=True)
