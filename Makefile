compile:
	erl -make
	(cd lib/erlang-oauth;$(MAKE))
	
clean:
	rm -rf ./ebin/*.*
	(cd lib/erlang-oauth;$(MAKE) clean)

#test: compile
#	erl -noshell -pa ./ebin -s mochiweb test -s init stop
#	(cd lib/nitrogen-trunk;$(MAKE) test)
	
doc: