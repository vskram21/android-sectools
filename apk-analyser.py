import os
import xml.etree.ElementTree as ET

def get_completepath(directory):
    file_paths = []  
    for path, direc, files in os.walk(directory):
        for filen in files:
            filepath = os.path.join(path, filen)
            file_paths.append(filepath)  

    return file_paths  

apk_path = os.path.dirname(os.path.realpath(__file__)) + "/in"
full_path = get_completepath(apk_path)
print full_path

#Setting the path of the tools
apktool_path = os.path.dirname(os.path.realpath(__file__)) + "/tools/apktool"
outfile_path = os.path.dirname(os.path.realpath(__file__)) + "/out"
apktool_cmd_string = apktool_path +  " d -f "+ full_path[0] +" "+ outfile_path
os.system (apktool_cmd_string)


logfile = os.path.dirname(os.path.realpath(__file__)) + "/log.txt"
f = open(logfile, "w")
f.write("Report on the analysis of the apk file located in the path   " )
f.write(full_path[0])
f.write("\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
f.write("\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

apktool_extracted_dir = os.path.dirname(os.path.realpath(__file__)) + "/out"
manifest_path = apktool_extracted_dir + "/AndroidManifest.xml"
tree = ET.parse(manifest_path)
root = tree.getroot()
#user_permission_list = []

f.write("\nApplication Persmissions:\n")
for user_permission in root.iter('uses-permission'):
	user_permission_list = user_permission.attrib.values()
	f.write(str(user_permission.attrib.values()))
	f.write("\n")
f.close()
print "\n\n\nPrinting the output file\n\n\n"
os.system("cat log.txt")
#print user_permission_list



