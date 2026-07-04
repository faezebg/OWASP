# OWASP Crypto Lab

This repository contains a set of Python scripts and supporting files designed to demonstrate common password handling, encryption, and credential cracking concepts in a test environment.

## Repository Overview

- `app.py`: Example application that demonstrates insecure password management or authentication workflow.
- `app-safe.py`: Safer alternative implementation that illustrates improved handling of credentials or protected operations.
- `cracker.py`: Attack simulation script for performing password cracking or recovery against sample data.
- `passwords.txt`: Sample password list used by the training and cracking scripts.
- `passwords-safe.txt`: Example dataset intended to represent improved password storage or safer sample credentials.
- `passProbablyList.txt`: Auxiliary password list for password guessing, enumeration, or testing.
- `templates/`: HTML templates used by the application to render pages or forms.

## Setup

1. Install Python 3 if it is not already available on your system.
2. Optionally create and activate a virtual environment to isolate dependencies.
   - `python -m venv venv`
   - `venv\Scripts\activate`
3. Install any required packages if the scripts depend on third-party modules.
   - `python -m pip install -r requirements.txt`
   - If this repository does not include `requirements.txt`, the scripts may rely only on Python standard library modules.

## Running the Scripts

Run the script you need with Python from the repository root.

- `python app.py` to run the demonstration application with insecure password handling.
- `python app-safe.py` to run the safer application version.
- `python cracker.py` to execute the password cracking or recovery simulation.

## Use Cases

This repository is intended for:

- Security training and education on password management weaknesses.
- Demonstrating the difference between insecure and safer application behavior.
- Practicing basic password cracking techniques against controlled sample data.
- Reviewing how template files and credential datasets are organized in a small crypto lab.

## Notes

- Do not use this repository for real credentials or production systems.
- Treat the sample password files as educational examples only.
- Review the code in `app.py`, `app-safe.py`, and `cracker.py` before running them so you understand the behavior of each script.
