# form-builder-server
Server for formbuilder made using Flask

Setup:
pip3 install -r requirements.txt
mysql -u username -p formbuilder < formbuilder.sql
cp dbconfig.example.py dbconfig.py #With correct mysql database values;
python3 run.py #localhost:5000
