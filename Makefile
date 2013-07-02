all: python_site full_site

full_site: 
	(cd full; rm posts/*; nikola build ; nikola build; nikola build; nikola build; nikola  deploy)
python_site: 
	(cd solopython; rm posts/*; nikola build ; nikola build; nikola build; nikola build; nikola  deploy)

clean:
	rm -rf */peewee.db */posts/* */.doit* */output/* -rf
