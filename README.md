# GolyakOFF

GolyakOFF is a Flutter-based mobile application that allows users to track their expenses by scanning receipts and categorizing the items using a machine learning model. The app provides an intuitive and efficient way to manage personal or business finances and gain insights into spending patterns.

## Features

- QR Code Scanner: Scan receipts using the built-in QR code scanner to extract the items purchased.
- Item Categorization: Categorize the scanned items using a machine learning model to gain insights into spending habits.
- Expense Tracking: Track and manage expenses by categorizing them into different categories.
- User-Friendly Interface: Intuitive user interface for smooth navigation and seamless user experience.

## Data Preparation

To train the machine learning model for item categorization, the app relies on a prepared dataset. The dataset is created by parsing product data from various websites. The following steps were taken to prepare the dataset:

1. The `bs4` library was used to scrape product data from several URLs, each corresponding to a specific category.
2. The product data was extracted from the HTML using BeautifulSoup.
3. The extracted product names and their corresponding categories were collected and stored in a list.
4. The collected data was then converted into a pandas DataFrame.
5. The DataFrame was saved as a CSV file named `product_category.csv`.

The prepared dataset serves as the training data for the machine learning model and enables accurate categorization of scanned items.



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

