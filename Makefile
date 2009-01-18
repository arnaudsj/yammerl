compile:
	erl -make
	(cd lib/erlang-oauth;$(MAKE))

run: compile
	exec erl -pa ./ebin ./lib/erlang-oauth/ebin -s crypto -s inets -s ssl -noshell -s yammer main -s init stop 
	
clean:
	rm -rf ./ebin/*.*
	(cd lib/erlang-oauth;$(MAKE) clean)

#test: compile
#	erl -noshell -pa ./ebin -s mochiweb test -s init stop
#	(cd lib/nitrogen-trunk;$(MAKE) test)
	
doc: