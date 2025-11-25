# Management

## Description

This project is a desktop web-based application built with Python and PyWebView.
It uses a Flask-like structure with templates, routes, models, and repositories, providing a clean and modular architecture.
The UI is rendered inside a native window through PyWebView, allowing a modern frontend experience while keeping a Python backend.

## Getting Started

### Configuration

- This project uses **PyWebView**, which supports Python up to version 3.11. If you are using a newer version, install Python 3.11: [python-3.11](https://www.python.org/downloads/release/python-3110/)
- Create a virtual environment: `python -m venv .venv`
- Activate the virtual environment: `.\.venv\Scripts\activate`
- Install Python dependencies: `pip install -r requirements.txt`

#### PyWebView / Executable Setup (Windows)

To build an executable using PyWebView, the following system tools must be installed:

1. Visual Studio Build Tools (C++)

    - Download: [Visual Studio Build Tools](https://visualstudio.microsoft.com/it/visual-cpp-build-tools/)
    - Install Desktop development with C++ workload.

2. .NET SDK (for `pythonnet`)

   - Download: [.NET SDK](https://dotnet.microsoft.com/en-us/download/dotnet)
   - Install the latest LTS version.
   - Verify installation: `dotnet --version`


3. NuGet

    - Download: [NuGet](https://www.nuget.org/downloads)
    - Save `nuget.exe` to a folder, e.g., `C:\NuGet\`.
    - Add the folder to your PATH environment variable.
    - Verify installation: `nuget`


## Project Information

### Icons

This project uses **FontAwesome** icons.

- Tutorials: [W3School](https://www.w3schools.com/icons/fontawesome_icons_intro.asp)
- Icons: [FontAwesome](https://fontawesome.com/search)

If you need custom images or icons, create an `/imgs/` folder and place the files inside it.

### Data Table

This project uses DataTables for handling tables, as they are more modern and flexible than the default $\text{<table>}$ element.

Documentation: [DataTables](https://datatables.net/)

### Project structure

```text
├───app
│   ├───models
│   ├───repositories
│   ├───routes
│   ├───templates
├───config
├───database
│   └───migrations
└───main.py
```

- **app/** $\rightarrow$ Contains the core of the application.
- **app/models/** $\rightarrow$ Defines the data models used by the application. Each file represents a database entity (e.g., User, Product, Post).
  > Add or modify a file here to introduce a new table or data structure.
- **app/repositories/** $\rightarrow$ Handles database operations: reading, writing, updating, and deleting records.
  > Modify these files to change how data is retrieved or stored.
- **app/routes/** $\rightarrow$ Contains all application routes (endpoints/pages), such as `/home`, `/login`, `/products`.
  > Add a file here whenever you want to create a new page or feature.
- **app/templates/** $\rightarrow$ Holds all HTML templates shown to the user (frontend).
  > Modify these files to update the UI or visual layout.
- **config/** $\rightarrow$ Contains general project settings (database configuration, keys, and environment setup).
  > Change global configuration settings here.
- **database/** $\rightarrow$ Contains database-related utilities.
- **database/migrations/** $\rightarrow$ Stores migration files describing structural changes to the database over time.
  > When you modify or add models, new migrations will appear here.
- **main.py** $\rightarrow$ The main entry point of the application. It initializes the Flask app, loads modules, and starts the server/PyWebView interface.
  > Modify this file to change the application startup behavior.

## Licence

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)

## Authors

- [DennisTurco](https://www.github.com/DennisTurco)

## Support

For support, email: dennisturco@gmail.com