lp_parser_assignment
====================

Ruby Version: ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin12.5.0]



parser = Parser.new("parser-test.txt")  

parser.parse  

parser.add_data('header','k1','k2') 

parser.add_data('header1','k1','k2')  

parser.get_data('header','k1')  

parser.data # display data hash 

parser.save_file('target.txt')  




