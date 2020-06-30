from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
import os
from flask_mail import Mail
from datetime import datetime
import math

with open('C:\\Users\\Vraj Desai\\Desktop\\Projects\\TechKillers\\config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = "super-secret-key"
app.config['UPLOAD-FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['google-user'],
    MAIL_PASSWORD=params['google-password']
)

mail = Mail(app)
if local_server == True:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
    db = SQLAlchemy(app)
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['pro_url']
    db = SQLAlchemy(app)


class Contacts(db.Model):
    Sr_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    phone_no = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(20), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    Sr_no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    content = db.Column(db.String(520), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(20), nullable=True)
    img_file = db.Column(db.String(25), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_post']))
    page = request.args.get('page')

    if not str(page).isnumeric():
        page = 1

    page = int(page)
    posts = posts[
            (page - 1) * int(params['no_of_post']):(page - 1) * int(params['no_of_post']) + int(params['no_of_post'])]
    if page == 1:
        prev = '#'
        next = '/?page=' + str(page + 1)
    elif page == last:
        prev = '/?page=' + str(page - 1)
        next = '#'
    else:
        prev = '/?page=' + str(page - 1)
        next = '/?page=' + str(page + 1)

    return render_template('index.html', posts=posts, prev=prev, next=next)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin-username']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin-username'] and userpass == params['admin-password']:
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)


@app.route('/edit/<string:Sr_no>', methods=['GET', 'POST'])
def edit(Sr_no):
    if 'user' in session and session['user'] == params['admin-username']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()
            img_file = request.form.get('img_file')

            if Sr_no == '0':
                post = Posts(title=box_title, tagline=tline, slug=slug, content=content, date=date, img_file=img_file)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(Sr_no=Sr_no).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.date = date
                post.img_file = img_file
                db.session.commit()
                return redirect('/edit/' + Sr_no)
    post = Posts.query.filter_by(Sr_no=Sr_no).first()
    return render_template('edit.html', params=params, Sr_no=Sr_no, post=post)


@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if 'user' in session and session['user'] == params['admin-username']:
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD-FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route('/delete/<string:Sr_no>', methods=['GET', 'POST'])
def delete(Sr_no):
    if 'user' in session and session['user'] == params['admin-username']:
        posts = Posts.query.filter_by(Sr_no=Sr_no).first()
        db.session.delete(posts)
        db.session.commit()
        return redirect('/dashboard')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', post=post)


@app.route('/contact', methods=['GET', 'POST'])
def contacts():
    if request.method == 'POST':
        name = request.form.get('name')
        phone = request.form.get('phone')
        email = request.form.get('email')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_no=phone, date=datetime.now(), email=email, message=message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            'New message from ' + name,
            sender=email,
            recipients=[params['google-user']],
            body=message + '\n' + phone
        )
    return render_template('contact.html')


if __name__ == '__main__':
    app.run(debug=True)
