# GolyakOFF

GolyakOFF is a Flutter-based mobile application that allows users to track their expenses by scanning receipts and categorizing the items using a machine learning model. The app provides an intuitive and efficient way to manage personal or business finances and gain insights into spending patterns.

## Features

- QR Code Scanner: Scan receipts using the built-in QR code scanner to extract the items purchased.
- Item Categorization: Categorize the scanned items using a machine learning model to gain insights into spending habits.
- Expense Tracking: Track and manage expenses by categorizing them into different categories.
- User-Friendly Interface: Intuitive user interface for smooth navigation and seamless user experience.

## Data Preparation and Training

1. Data Preparation:
   - A dataset named `product_category.csv` is prepared, which contains the product names and their corresponding categories.
   - The dataset is created by parsing product data from various websites using web scraping techniques.
   - The Python script used for data preparation can be found in the `product_categoriser.ipynb` file.
 
 
   ![image](https://github.com/nochnik/Golyakoff/assets/51897676/0e8dc7a3-09a4-4fd6-bbfd-d0b25ac8e5f3)


2. Model Training:
   - The prepared dataset is loaded into a pandas DataFrame.
   - The data is split into training and testing sets using `train_test_split`.
   - The product names are converted into feature vectors using `CountVectorizer`.
   - The categories are encoded using `LabelEncoder`.
   - A logistic regression model is trained using the feature vectors and encoded categories.
   - The model's accuracy and classification report are computed and printed.
   - The trained model, vectorizer, and label encoder are saved using `joblib` for later use.

![image](https://github.com/nochnik/Golyakoff/assets/51897676/83df2401-f4e9-40ad-b637-3af5dce54532)


You can find the code for model training in the `model_classificator.ipynb` file.



## Technologies Used

- Flutter: A cross-platform framework for building mobile applications.
- Dart: The programming language used for developing Flutter applications.
- QR Code Scanner package: A Flutter package used to scan QR codes.
- Flask: A micro web framework used for building the backend server.
- BeatufulSoup: A python library, requeried for parsing data from a website
- Scikit-learn: A machine learning library used for training and categorizing items.

## Getting Started

To get started with the GolyakOFF App, follow these steps:

1. Clone the repository:
git clone https://github.com/nochnik/Golyakoff.git
2. Install the dependencies:
flutter pub get
3. Run the app:
flutter run

