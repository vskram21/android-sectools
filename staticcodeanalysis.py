import re
import os
import pandas
import argparse
import configparser
import copy

def file_search(d1, dirn, file):
    filepath = os.path.abspath(os.path.join(dirn,file))
    for i in regex_list:
        for k, regex in i.items():
            for match in regex.findall(open(filepath, encoding="utf8").read()):
                d2 = copy.deepcopy(d1)
                d2['Type'] = k
                d2['Match'] = match
                file_list.append(d2)    

def search_code(sourcedir):
    
    for dirn, dirp, files in os.walk(sourcedir):
        for file in files:
            if file.endswith('.java'):
                d1 = {'file':file, 'language':'Java'}
                file_search(d1,dirn,file)                
            elif file.endswith('.py'):
                d1 = {'file':file, 'language':'Python'}
                file_search(d1,dirn,file)
            elif file.endswith('.ts'):
                d1 = {'file':file, 'language':'TypeScript'}
                file_search(d1,dirn,file)
            elif file.endswith('.js'):
                d1 = {'file':file, 'language':'JavaScript'}
                file_search(d1,dirn,file)
            elif file.endswith('.smali'):
                d1 = {'file':file, 'language':'smali'}
                file_search(d1,dirn,file)
            elif file.endswith('.xml'):
                d1 = {'file':file, 'language':'xml'}
                file_search(d1,dirn,file)                      
    df = pandas.DataFrame(file_list)
    df.to_csv(os.path.join(sourcedir,'results.csv'))
    #df.to_excel('temp.xls')
            

config = configparser.ConfigParser()
config.read('regex.conf')
regex_list = []
file_list = []
for key in config['default']:
    regex_list.append({key: re.compile(config['default'][key])})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = 'Simple tool to perform basic static code analysis')
    parser.add_argument('-i', '--input', nargs='?', help="Input path of the source code", metavar="FILE")
    args = parser.parse_args()
    if (args.input):
        input_path = os.path.normpath(args.input)
        search_code(input_path)