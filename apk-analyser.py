import os

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

