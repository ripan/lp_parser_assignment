lp_parser_assignment
====================


parser = Parser.new("parser-test.txt")  
parser.parse  
parser.add_data('header','k1','k2') 
parser.add_data('header1','k1','k2')  
parser.get_data('header','k1')  
parser.data # display data hash 
parser.save_file('ripan.txt') #save data hash to file 

