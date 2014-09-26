import os
import xml.etree.ElementTree as ET

def get_completepath(directory):
    file_paths = []  
    file_name = []
    for path, direc, files in os.walk(directory):
        for filen in files:
            filepath = os.path.join(path, filen)
	    file_name.append(filen)
            file_paths.append(filepath)  

    return file_paths, file_name  
    
def get_complete_out_path (directory):
    smali_file_name = []
    smali_file_path = []
    for path, direc, files in os.walk(directory):
        for filen in files:
		if filen.endswith('.smali'):
			smali_file_name.append(filen)
			filepath = os.path.join(path, filen)
			smali_file_path.append(filepath)
    return smali_file_path, smali_file_name

def logfile_writter(files):
	dictionary = []
	with open('dict.txt') as fp:
		for line in fp:
			dictionary.append(line.rstrip())
	for each in files:
		with open(each) as fp:
			for line in fp:
				#print "entered fp:", line
				for dictionary_item in dictionary:
					if dictionary_item in line:
						#print "extered dictionary"
						print  dictionary_item, line
					
	print dictionary

apk_path = os.path.dirname(os.path.realpath(__file__)) + "/in"
full_path, file_name = get_completepath(apk_path)
print full_path

#Setting the path of the tools
apktool_path = os.path.dirname(os.path.realpath(__file__)) + "/tools/apktool"
outfile_path = os.path.dirname(os.path.realpath(__file__)) + "/out"
apktool_cmd_string = apktool_path +  " d -f "+ full_path[0] +" "+ outfile_path
os.system (apktool_cmd_string)


logfile = os.path.dirname(os.path.realpath(__file__)) + "/log.txt"
f = open(logfile, "w")
f.write("Report on the analysis of the apk file:" )
f.write(file_name[0])
f.write("\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
f.write("\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

apktool_extracted_dir = os.path.dirname(os.path.realpath(__file__)) + "/out"
manifest_path = apktool_extracted_dir + "/AndroidManifest.xml"
'''tree = ET.parse(manifest_path)
root = tree.getroot()


#user_permission_list = []

f.write("\nApplication Permissions:\n")
for user_permission in root.iter('uses-permission'):
	user_permission_list = user_permission.attrib.values()
	f.write(str(user_permission.attrib.values()))
	f.write("\n")
f.close()
'''
print "\n\n\nPrinting the output file\n\n\n"
os.system("cat log.txt")

manifest_print_cmd = "cat " + manifest_path 
os.system(manifest_print_cmd )
#print user_permission_list

out_directory_path = os.path.dirname(os.path.realpath(__file__)) + "/out"
smali_file_path, smali_file_name = get_complete_out_path(out_directory_path)
#print smali_file_path, smali_file_name

logfile_writter(smali_file_path)






