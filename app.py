from flask import Flask, render_template

app = Flask(__name__)
app.debug = True

# Index Page
@app.route('/')
def index():
    return render_template('index.html')

# Shop Page
@app.route('/shop')
def shop():
    return render_template('shop.html')

# Coming Soon Page
@app.route('/coming_soon')
def coming_soon():
    return render_template('coming_soon.html')

# Coming Soon Page
@app.route('/contact')
def contact():
    return render_template('contact.html')

# Custom error handler for 404 (Not Found) errors
@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404


if __name__ == '__main__':
    app.run()