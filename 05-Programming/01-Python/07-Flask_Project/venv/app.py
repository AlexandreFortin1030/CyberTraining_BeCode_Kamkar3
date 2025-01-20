from flask import Flask, render_template, request, redirect, url_for, flash
import re
import html  # Import the html module for escaping HTML

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # WARNING: the secret key should not be hardcoded in here but rather generated dynamically and changed regularly

MAX_INPUT_LENGTH = 100  # Define the maximum input length

def sanitize_input(user_input: str) -> str:
    # Strip leading/trailing whitespace and escape HTML
    return html.escape(user_input.strip())

def validate_input(user_input: str) -> str:
    """Validate user input and raise an exception if it exceeds the maximum length."""
    if len(user_input) > MAX_INPUT_LENGTH:
        raise ValueError("Input exceeds maximum allowed length.")
    return user_input

def validate_email(email: str) -> str:
    """Validate email format using a regular expression."""
    email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    if not re.match(email_regex, email):
        raise ValueError("Invalid email format.")
    return email

@app.route('/', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        try:
            # Retrieve and sanitize form data
            prenom = sanitize_input(request.form['prenom'])
            nom = sanitize_input(request.form['nom'])
            email = sanitize_input(request.form['email'])
            pays = sanitize_input(request.form['pays'])
            message = sanitize_input(request.form['message'])
            genre = sanitize_input(request.form['genre'])
            sujets = request.form.getlist('sujets')

            # Validate inputs
            validate_input(prenom)
            validate_input(nom)
            validate_email(email)  # Validate email format
            validate_input(pays)
            validate_input(message)

            # Here you can process the validated data (e.g., save to a database)

            # Redirection
            return redirect(url_for('success'))

        except ValueError as e:
            # Flash an error message if validation fails
            flash(str(e))
            return redirect(url_for('contact'))  # Redirection

    return render_template('contact.html')

@app.route('/success')
def success():
    return "Votre message a été envoyé avec succès !"

if __name__ == '__main__':
    app.run(debug=True)
