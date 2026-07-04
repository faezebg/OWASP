from flask import Flask, request, render_template
import hashlib

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")


@app.route('/save', methods=['POST'])
def save():

    username = request.form['username']
    password = request.form['password']

    hashed = hashlib.md5(password.encode()).hexdigest()

    with open("passwords.txt", "a") as f:
        f.write(username + " : " + hashed + "\n")

    return "Password stored!"

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
