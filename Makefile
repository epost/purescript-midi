build:
	pulp browserify > bundle.js

# https://www.npmjs.com/package/http-server
run:
	http-server

inst:
	bower install

clean:
	rm -rf output

purge: clean
	rm -rf .pulp-cache bower_components output
