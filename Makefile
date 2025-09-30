# Concatenate the top level README.md from the header and each language specific stub
README.md: README.header.md vhdl/README.md
	cat $^ > $@

