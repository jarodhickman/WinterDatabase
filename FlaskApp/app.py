from flask import Flask, render_template, request, json, redirect
from flaskext.mysql import MySQL
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)
mysql = MySQL()
#mysql configs
app.config['MYSQL_DATABASE_USER'] = 'admin'
app.config['MYSQL_DATABASE_PASSWORD']= 'password'
app.config['MYSQL_DATABASE_DB'] = 'bitbizzar'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def main():
    return render_template('index.html')
@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
@app.route('/signUp',methods=['POST'])
@cross_origin()
def signUp():
	conn = mysql.connect()
	cursor = conn.cursor()

	_name = request.form['inputName']
	_email= request.form['inputEmail']
	_password = request.form['inputPassword']
	_ssn = request.form['inputSSN']
	_phone = request.form['inputPhone']

	cursor.execute("INSERT INTO User (User_Name, User_SSN, User_Email, User_Phone, Admin, User_Password) VALUES (%s, %s, %s, %s, %s, %s)", (_name, _ssn, _email, _phone, 0, _password))
	conn.commit()
	cursor.close()
	return redirect("/signup")
@app.route('/showShop')
def showShop():
	userID = request.args.get('id')
	conn = mysql.connect()
	cursor = conn.cursor()

	cursor.execute("SELECT Wallet.walAddress, Wallet.walAmount, Product.prodName FROM Wallet INNER JOIN Product ON Wallet.prodID=Product.prodID AND Wallet.User_ID = %s", userID)
	walletResults = cursor.fetchall()
	cursor.execute("SELECT User_Name FROM User WHERE User_ID = %s", userID)
	userResults = cursor.fetchall()
	cursor.execute("SELECT prodID, prodName FROM Product")
	coinResults = cursor.fetchall()
	cursor.close()
	return render_template('shop.html', wallet=walletResults, user=userResults, coin=coinResults, id=userID)
@app.route('/makeWallet', methods=['POST','GET'])
def wallet():
	conn = mysql.connect()
	cursor = conn.cursor()

	coinID = request.form['coinlist']
	print(coinID)
	# print('in wallet function')
	userID = request.form['userID']
	print(userID)

	cursor.execute("INSERT INTO Wallet (User_ID, walAmount, prodID) VALUES (%s, 500, %s)", (userID, coinID))
	conn.commit()
	cursor.close()

	return redirect('/showShop?id=userID')

@app.route('/makeOrder',methods=['POST', 'GET'])
def order():
	conn = mysql.connect()
	cursor = conn.cursor()

	userID = request.form['userID']
	toadd = request.form['toAdd']
	fromadd = request.form['fromAdd']
	amount = request.form['amount']
	

	cursor.execute("INSERT INTO ExOrder (User_ID, toAddress, fromAddress, orderAmount) VALUES (%s, %s, %s, %s)", (userID, toadd, fromadd, amount))
	cursor.execute("UPDATE Wallet SET walAmount = walAmount - %s WHERE walAddress = %s", (amount, fromadd))
	cursor.execute("UPDATE Wallet SET walAmount = walAmount + %s WHERE walAddress = %s", (amount, toadd))
	conn.commit()
	cursor.close()
	return redirect('/showShop?id=userID')

if __name__ == "__main__":
	app.run()
    