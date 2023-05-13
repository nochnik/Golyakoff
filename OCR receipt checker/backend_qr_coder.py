from flask import Flask, request, jsonify
from bs4 import BeautifulSoup
import requests
import pickle
import joblib

vectorizer = joblib.load('E:\Programming Journey\ML Journey\OCR receipt checker\OCR receipt checker\model\lectorizer.pkl')
label_encoder = joblib.load('E:\Programming Journey\ML Journey\OCR receipt checker\OCR receipt checker\model\label_encoder.pkl')
model = joblib.load('E:\Programming Journey\ML Journey\OCR receipt checker\OCR receipt checker\model\model.pkl')

app = Flask(__name__)

@app.route('/parse', methods=['POST'])
def parse_info():
    data = request.get_json()
    url = data['url']

    response = requests.get(url)
    html_content = response.content
    soup = BeautifulSoup(html_content, 'html.parser')
    
    list_of_items = soup.find_all('li', style="border-bottom: 1px dotted #777; padding: 10px 0;")
    item_texts = [i.find(text=True).strip() for i in list_of_items]
    item_texts = [' '.join(i.split()[1:-1]) for i in item_texts]

    return jsonify(item_texts)


@app.route('/categorize', methods=['POST'])
def categorize():
    data = request.get_json()
    categories = []
    for item in data:
        item_vec = vectorizer.transform([item])
        category_enc = model.predict(item_vec)
        category = label_encoder.inverse_transform(category_enc)
        categories.append(category[0])
    return jsonify(categories)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')