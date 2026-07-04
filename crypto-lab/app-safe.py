from flask import Flask, request, render_template
import bcrypt

app = Flask(__name__)
@app.route('/')
def index():
    return render_template("index.html")

def hash_password(password):
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed

def check_password(entered_password, stored_hash):
    return bcrypt.checkpw(entered_password.encode('utf-8'), stored_hash)

@app.route('/save', methods=['POST'])
def save():
    username = request.form['username']
    password = request.form['password']
    
    hashed_pw = hash_password(password)
    
    with open('passwords-safe.txt', 'ab') as f:
        f.write(username.encode() + b":" + hashed_pw + b"\n")
    
    return "User registered successfully with secure hash!"

@app.route('/read_file')
def read_file_vulnerable():
    filename = request.args.get('filename')

    if filename:
        try:
            with open(filename, 'r') as f:
                content = f.read()
            return f"<pre>{content}</pre>"
        except FileNotFoundError:
            return "File not found!", 404
        except Exception as e:
            return f"An error occurred: {e}", 500
    return "Please provide a filename parameter (e.g., /read_file?filename=test.txt)"

if __name__ == '__main__':
    app.run(debug=True)
