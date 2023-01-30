# Overview
---
Bot that leverages Robinhood APIs to buy/sell stocks

# Robinhood Account
### ***Sign up***
Sign up for a Robinhood brokerage account at https://robinhood.com/.

### ***Why Robinhood***
Robinhood is an easy to use platform that offers transactions with zero commission, no account minimums, and allows user to buy fractional shares. Additionally, Robinhood has API support thanks to [robin_stock](https://algotrading101.com/learn/robinhood-api-guide/)

### ***Configure for Trading***
One drawback of Robinhood is that low value accounts are blocked from frequent day trading. Robinhood instant and gold accounts are not allowed to make more than 3 day trades in any 5 consecutive bussiness day period. Additionally, your account will be marked as pattern day tradding when making 4 day trades in 5 business days. You can get around these limitations by making your Robinhood account a cash account [learn more here](https://robinhood.com/us/en/support/articles/pattern-day-trading/)

# Azure Bootstrapping

## Create an Azure Account and Subscription
Create an [Azure Account](https://portal.azure.com/#home) and [Azure Subscription](https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription).

## Bootstrap Script
Run the bootstrap.ps1 script in powershell ***as admin*** to initialize the required infra (i.e. resource group, key vault, storage account, and Azure function) in Azure.

# Getting Started with Azure Functions in Python

## Setup
Follow the steps under [Configure your environment](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-python?pivots=python-mode-decorators)

## Python Programming Model V2 (Preview)

The new programming model in Azure Functions Python delivers an experience that aligns with Python development principles, and subsequently with commonly used Python frameworks. 

The improved programming model requires fewer files than the default model, and specifically eliminates the need for a configuration file (`function.json`). Instead, triggers and bindings are represented in the `function_app.py` file as decorators. Moreover, functions can be logically organized with support for multiple functions to be stored in the same file. Functions within the same function application can also be stored in different files, and be referenced as blueprints.

In addition to the [documentation](https://docs.microsoft.com/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level), hints are available in code editors that support type checking with PYI files.

To learn more about the new programming model for Azure Functions in Python, see [Programming Models in Azure Functions](https://aka.ms/functions-programming-models).

## Notes

- Mix and match of Functions written in the V1 programming model and the V2 programming model in the same Function App will not be supported.
- At this time, the main functions file must be named `function_app.py`.

To learn more about the new programming model for Azure Functions in Python, see the [Azure Functions Python developer guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level).

## Getting Started

Project Structure

The main project folder (<project_root>) can contain the following files:

* *function_app.py*: Functions along with their triggers and bindings are defined here.
* *local.settings.json*: Used to store app settings and connection strings when running locally. This file doesn't get published to Azure.
* *requirements.txt*: Contains the list of Python packages the system installs when publishing to Azure.
* *host.json*: Contains configuration options that affect all functions in a function app instance. This file does get published to Azure. Not all options are supported when running locally.
* *blueprint.py*: (Optional) Functions that are defined in a separate file for logical organization and grouping, that can be referenced in `function_app.py`.    
* *.vscode/*: (Optional) Contains store VSCode configuration.
* *.venv/*: (Optional) Contains a Python virtual environment used by local development.
* *Dockerfile*: (Optional) Used when publishing your project in a custom container.
* *tests/*: (Optional) Contains the test cases of your function app.
* *.funcignore*: (Optional) Declares files that shouldn't get published to Azure. Usually, this file contains `.vscode/` to ignore your editor setting, `.venv/` to ignore local Python virtual environment, `tests/` to ignore test cases, and `local.settings.json` to prevent local app settings being published.
  
## Developing your first Python function using VS Code

If you have not already, please checkout our [quickstart](https://aka.ms/fxpythonquickstart) to get you started with Azure Functions developments in Python.

## Publishing your function app to Azure
  
For more information on deployment options for Azure Functions, please visit this [guide](https://docs.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-python#publish-the-project-to-azure).

## Next Steps
  
To learn more specific guidance on developing Azure Functions with Python, please visit [Azure Functions Developer Python Guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-python?tabs=asgi%2Capplication-level).