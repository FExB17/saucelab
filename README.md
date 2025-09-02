# SauceLab Test Automation

Dieses Repository enthält eine Robot Framework Test-Suite für die Webapplikation [SauceDemo](https://www.saucedemo.com).  
Die Tests laufen mit **Robot Framework** und **Playwright** und sind für den Einsatz in CI/CD (GitHub Actions) vorbereitet.

## Projektstruktur
```
.
├── tests/         # Test-Suites (.robot), pro Feature eigener Ordner
├── resources/     # Keywords & Page Objects
├── variables/     # Testdaten (yaml/json/py)
├── libs/          # Eigene Python-Keywords
├── config/        # Linter & Formatter (robocop, robotidy)
└── reports/       # CI-Artefakte (nicht versioniert)
```

## Best Practices
- **Ein Abstraktionslevel pro Test** (Tests beschreibend, Keywords kapseln Details)  
- **Page Object Pattern**: Locators in `resources/`, keine UI-Details in Tests  
- **Keine Sleeps**, stattdessen Auto-/Explicit Waits  
- **Saubere Tags**: `component:ui`, `smoke`, `regression`, `jira:SL-UI-XXX`  
- **Setup/Teardown**: Suite Setup für teure Init, Test Setup für saubere Startposition
- **Debugging**: SlowMo variable zum Debuggen via UI

## Ausführung
Lokaler Testlauf:
```bash
robot -d reports tests/
```

Bestimmte Tags ausführen:
```bash
robot -d reports --include smoke tests/
```

Parallel mit Pabot (⚠️ ToDo: Parallelisierung im Projekt noch umsetzen):
```bash
pabot --processes 4 -d reports tests/
```

## CI/CD
- Läuft headless in GitHub Actions  
- Export als JUnit-XML für Reporting  
- Screenshots & Logs werden als Artefakte gespeichert  

## Anforderungen
- Python 3.12+
- Robot Framework
- robotframework-browser (Playwright)
- robocop, robotidy (für Linting & Formatierung)

