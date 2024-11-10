# Financial Fraud Detection Analysis

This repository contains R code for analyzing financial fraud through two different approaches:
1. Benford's Law Analysis for Vendor Payments
2. Machine Learning-based Credit Card Fraud Detection

## Table of Contents
- [Overview](#overview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Methods](#methods)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project implements two different approaches to detect financial fraud:

### 1. Benford's Law Analysis
- Analyzes vendor payment patterns using Benford's Law
- Performs two-digit analysis on invoice amounts
- Includes chi-square test for conformity to Benford's Law
- Identifies suspicious transactions for further investigation

### 2. Credit Card Fraud Detection
- Uses Random Forest machine learning model
- Implements ROSE (Random Over-Sampling Examples) for handling imbalanced data
- Includes model evaluation and prediction capabilities

## Requirements

Required R packages:
```R
- benford.analysis
- BenfordTests
- readxl
- dplyr
- caTools
- caret
- randomForest
- ROSE
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/saivigneshgandhe/financial-fraud-detection.git
cd financial-fraud-detection
```

2. Install required R packages:
```R
install.packages(c("benford.analysis", "BenfordTests", "readxl", "dplyr", 
                  "caTools", "caret", "randomForest", "ROSE"))
```

## Project Structure

```
financial-fraud-detection/
├── data/
│   ├── Vendor_Payments.xlsx
│   └── creditcard.csv (https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud?resource=download)
├── scripts/
│   ├── benford_analysis.R
│   └── credit_card_fraud.R
├── results/
├── README.md
└── LICENSE
```

## Usage

### Benford's Law Analysis
```R
# Load and analyze vendor payments
source("scripts/benford_analysis.R")

# Generate Benford's Law plots
plot(bfd.vp)

# Get suspicious transactions
suspicious_transactions <- getSuspects(bfd.vp, vp)
```

### Credit Card Fraud Detection
```R
# Load and run credit card fraud detection
source("scripts/credit_card_fraud.R")

# Make predictions on new data
new_predictions <- predict(rf_model, newdata = new_data)
```

## Methods

### Benford's Law Analysis
- Implements first and second digit analysis
- Uses chi-square test for statistical validation
- Identifies transactions that deviate from expected patterns

### Credit Card Fraud Detection
- Data splitting (70% training, 30% testing)
- ROSE implementation for handling class imbalance
- Random Forest model with 50 trees
- Feature importance analysis

## Results

The project provides:
- Visual representations of Benford's Law conformity
- List of suspicious transactions from vendor payments
- Random Forest model performance metrics
- Prediction capabilities for new transactions

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

For any additional questions or concerns, please open an issue in the repository.
