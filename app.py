from flask import Flask, request, render_template, redirect, url_for
from database import Database
from werkzeug.security import generate_password_hash, check_password_hash
import os

app = Flask(__name__)
app.debug = True # Enable debug mode
db = Database() # Create an instance of the Database class

# Index Page
@app.route('/')
def index():

    table_name = "products_tbl"
    data = db.fetch_all_data(table_name)

    comments_table_name = "comments_tbl"
    comments_data = db.fetch_all_data(comments_table_name)

    return render_template('index.html', data=data)

# Shop Page
@app.route('/shop')
def shop():

    table_name = "products_tbl"
    data = db.fetch_all_data(table_name)

    cat_table_name = "products_categories_tbl"
    product_cat= db.fetch_all_data(cat_table_name)

    size_table_name = "products_size_tbl"
    size_cat= db.fetch_all_data(size_table_name)

    return render_template('shop.html', data=data, product_cat=product_cat, size_cat=size_cat)

# Coming Soon Page
@app.route('/coming_soon')
def coming_soon():
    return render_template('coming_soon.html')

# Contact Page
@app.route('/contact')
def contact():

    table_name = "contactus_tbl"
    data = db.fetch_all_data(table_name)
    return render_template('contact.html', data=data)

# login Page
@app.route('/login')
def login():
    return render_template('login.html')

# register Page
@app.route('/register')
def register():
    return render_template('register.html')


@app.route('/new_registration', methods=['POST'])
def new_registration():
    if request.method == 'POST':
        # Get data from the request
        firstname = request.form.get('firstname')
        lastname = request.form.get('lastname')
        email = request.form.get('email')
        password = request.form.get('password')

        # Specify the table name you want to insert data into
        table_name = "users_tbl"  # Change this dynamically as needed

        # Hash the password using 'pbkdf2:sha256' method
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        # Insert data into the specified table
        if db.insert_data(table_name, firstname=firstname, lastname=lastname, email=email, password=hashed_password):
            return render_template('login.html', success="Successfully Registered")
        else:
            return "Error inserting ."


@app.route('/login_account', methods=['POST'])
def login_account():
    return render_template('account.html', success="Successfully Login")


@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # Check if the post request has a file part
        if 'file' not in request.files:
            return "No file part"

        file = request.files['file']

        # If the user does not select a file, the browser submits an empty file without a filename
        if file.filename == '':
            return "No selected file"

        # If the file is provided and has a valid filename
        if file:
            # Save the file to the upload folder
            filename = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
            file.save(filename)
            return "File uploaded successfully"

    # Render the HTML form for file upload
    return render_template('upload.html')

# Custom error handler for 404 (Not Found) errors
@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404

if __name__ == "__main__":
    app.run()
