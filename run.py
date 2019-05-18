from flask import Flask, request
import dbconfig
import json
from dbconfig import dbconfig
import mysql.connector

app = Flask(__name__)

def sql():
    try:
        cnx = mysql.connector.connect(user=dbconfig.USER, database=dbconfig.DB, 
        password=dbconfig.PASSWORD, host=dbconfig.HOST)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    return cnx

@app.route('/create_form', methods=['GET','POST'])
def create_form():
    cnx = sql()
    cursor = cnx.cursor()
    print(request.data)
    data = json.loads(request.data)
    print (data)
    stmt = "INSERT INTO forms ( formId, name, description"
    for i in range(1, len(data)-2):
        stmt += ",field"+str(i)        
    stmt+=') values ('
    
    stmt += "'"+data[0][2]+"' , " #sets formID
    stmt += "'"+data[1][2]+"' , " #set name of form
    stmt += "'"+data[2][2] +"' " #sets desc
    for i in range(3, len(data)):
        if data[i][1] == 'CheckBox':
            temp = []
            for j in range(len(data[i][2])):
                temp.append(data[i][2][j][0])
            print(temp)
            stmt += ",'"+json.dumps([data[i][0],temp])+"'"
        else:
            stmt += ",'" + data[i][ 0] + "'"
    stmt+=");"  
    print (stmt)

    stmt1 = "INSERT INTO fields ( formId, name, description"
    for i in range(1, len(data)-2):
        stmt1 += ",field"+str(i)        
    stmt1+=') values ('

    stmt1 += "'"+data[0][2]+"' , "
    for i in range(1, len(data)-1):
        stmt1 += "'"+data[i][1]+"' , "
    stmt1+="'"+data[len(data)-1][1]+"');"  
    print (stmt1)


    try:
        cursor.execute(stmt)
        cursor.execute(stmt1)
        cnx.commit()
        return json.dumps('{"code":1,"mess":"Form saved successfully"}')
    except mysql.connector.IntegrityError:
        return json.dumps('{"code":0,"mess":"Form could not be saved"}')
    finally:
        cursor.close()
        cnx.close()

@app.route('/getForms', methods=['GET','POST'])
def getForms():
    cnx = sql()
    cursor = cnx.cursor()
    stmt = "select formID from forms;"
    try:
        cursor.execute(stmt)
        res = cursor.fetchall()
        result = []
        for row in res:
             result.append(row[0])
        print (json.dumps('{"code":1,"data":'+json.dumps(result)+'}'))
        return json.dumps('{"code":1,"data":'+json.dumps(result)+'}')
    except mysql.connector.IntegrityError:
        print (json.dumps('{"code":0,"mess":"Could not fetch form data"}'))
        return json.dumps('{"code":0,"mess":"Could not fetch form data"}')
    finally:
        cursor.close()
        cnx.close()

@app.route('/getFields', methods=['GET','POST'])
def getFields():
    cnx = sql()
    cursor = cnx.cursor()
    data = json.loads(request.data)
    id = data['data']
    print (id)
    stmt = "select * from forms where formId = '{}'".format(id)
    print (stmt)
    stmt1 = "select * from fields where formId = '{}'".format(id)
    try:
        cursor.execute(stmt)
        res = cursor.fetchall()
        for row in res:
            form = row[1:]
        cursor.execute(stmt1)
        res = cursor.fetchall()
        for row in res:
            field = row[1:]
        print(form)
        print(field)
        result = list(map(lambda x, y:(x,y), form, field)) 
        print (result)
        print (json.dumps('{"code":1,"data":'+json.dumps(result)+'}'))
        return json.dumps('{"code":1,"data":'+json.dumps(result)+'}')
    except mysql.connector.IntegrityError:
        print (json.dumps('{"code":0,"mess":"No such form exists"}'))
        return json.dumps('{"code":0,"mess":"No such form exists"}')
    finally:
        cursor.close()
        cnx.close()
    return "dfdf"

@app.route("/submitResponse",methods=['GET','POST'])
def submitResponse():
    cnx = sql()
    cursor = cnx.cursor()
    # print (request.data)
    data = json.loads(request.data)
    # print (data['for  mID'])
    ans = []
    for i in range(len(data['fields'])):
        if data['fields'][i][1] is not None:
            if data['fields'][i][1] == "CheckBox":
                temp = []
                for j in range(len(data['fields'][i][2])):
                    if data['fields'][i][2][j] is None:
                        temp.append(False)
                    else:
                        temp.append(data['fields'][i][2][j])
                ans.append(temp)
            else:
                ans.append(data['fields'][i][2]);

    print(ans)
    stmt1 = "INSERT INTO responses ( formId "
    for i in range(0, len(ans)):
        stmt1 += ",field"+str(i+1)        
    stmt1+=') values ('
    stmt1 += "'"+data['formID']+"'"
    
    for i in range(0, len(ans)):
        # print (str(ans[i]))
        stmt1 += ",'"+str(ans[i])+"' "
    stmt1+=");"  
    print (stmt1)
    try:
        cursor.execute(stmt1)
        cnx.commit()
        return json.dumps('{"code":1,"mess":"Responses saved successfully"}')
    except mysql.connector.IntegrityError:
        return json.dumps('{"code":0,"mess":"Responses could not be saved"}')
    finally:
        cursor.close()
        cnx.close()

@app.route("/getResponses",methods=['GET','POST'])
def getResponses():
    cnx = sql()
    cursor = cnx.cursor()
    # print (request.data)
    data = json.loads(request.data)
    stmt = "select * from forms where formId = '{}';".format(data['formId'])
    print (stmt)
    stmt1 = "select * from responses where formId = '{}';".format(data['formId'])
    print (stmt1)
    stmt2 = "select * from fields where formId = '{}';".format(data['formId'])
    print (stmt2)
    try:
        cursor.execute(stmt)
        res = cursor.fetchall()
        for row in res:
            forms = row[1:]

        responses = []
        cursor.execute(stmt1)
        res = cursor.fetchall()
        for row in res:
            responses.append(row[2:])

        cursor.execute(stmt2)
        res = cursor.fetchall()
        for row in res:
            fields = row[1:]
        result = {"forms":forms,"fields":fields,"responses":responses}
        print (result)
        print (json.dumps('{"code":1,"data":'+json.dumps(result)+'}'))
        return json.dumps('{"code":1,"data":'+json.dumps(result)+'}')
    except mysql.connector.IntegrityError:
        print (json.dumps('{"code":0,"mess":"No such form exists"}'))
        return json.dumps('{"code":0,"mess":"No such form exists"}')
    finally:
        cursor.close()
        cnx.close()
    # return "dfdf"

app.config.from_object('config.DevelopmentConfig')
app.run()

# CREATE TABLE forms ( formId int NOT NULL PRIMARY KEY, field1 varchar(100), field2 varchar(100), field3 varchar(100), field4 varchar(100),field5 varchar(100),field6 varchar(100),field7 varchar(100),field8 varchar(100),field9 varchar(100),field10 varchar(100));