import os, shutil
import argparse 

def apktool():
    apktool_path = os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/apktool/apktool.bat'))
    os.system( apktool_path + ' d -s -r -f ' + args.input + ' -o ' + args.output)

def enjarify():
    enjarify_path =  os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/enjarify-1.0.3/enjarify.bat'))
    os.system(enjarify_path + ' -o ' + jar_file + ' ' + input_path)
    
def procyon():
    procyon_path =  os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/procyon-decompiler-0.5.30.jar'))
    os.system('java -jar ' + procyon_path + ' ' + jar_file + ' -o ' + os.path.normpath(output_path+'java_source'))

parser = argparse.ArgumentParser(description = 'Simple tool to perform reverse engineering of Android application. It uses apktool, dex2jar and enjarify')
parser.add_argument('-i', '--input', nargs='?', required=True, help="Apk file which needs to be converted", metavar="FILE")
parser.add_argument('-o','--output', nargs='?', required=True, help="Output directory")
args = parser.parse_args()

input_path = os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)),args.input))
output_path = os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)),args.output))
jar_file = os.path.normpath(output_path+"/classes.jar")
print (input_path)

if (os.path.exists(input_path)):
    if (os.path.exists(output_path) == False):
        os.makedirs(output_path)
    else: 
        shutil.rmtree(output_path)
    apktool()
    enjarify()
    procyon()


else:
    print ("File doesn't exists. Check if you have provided the right path to the APK")

