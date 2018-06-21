import os
import shutil
import argparse
import configparser
import subprocess
import re
import base64
import pandas
import staticcodeanalysis


def apktool():
    apktool_path = os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/apktool/apktool.bat'))
    subprocess.call([apktool_path, 'd', '-f', '-o', output_path, input_path], shell=True)

def enjarify():
    enjarify_path =  os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/enjarify-1.0.3/enjarify.bat'))
    subprocess.call([enjarify_path, '-o', jar_file, input_path], shell=True)
    
def cfr():
    cfr_path =  os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tools/cfr_0_130.jar'))
    subprocess.call(['java', '-jar', cfr_path, jar_file, '--caseinsensitivefs',  '--outputdir', java_source], shell=True)

if __name__ == "__main__":
     
    parser = argparse.ArgumentParser(description = 'Simple tool to perform reverse engineering of Android application. It uses apktool, dex2jar and enjarify')
    parser.add_argument('-i', '--input', nargs='?', required=True, help="Apk file which needs to be converted", metavar="FILE")
    parser.add_argument('-o','--output', nargs='?', required=True, help="Output directory", metavar="FILE")
    parser.add_argument('-a', '--analysis', action='store_false', required=False, help="Analysis - looks for keys in the java code by default analysis is enabled and takes the sensitive_strings.txt file")
    args = parser.parse_args()

    input_path = args.input
    output_path = os.path.normpath(os.path.join(os.path.dirname(os.path.realpath(__file__)),args.output))
    jar_file = os.path.normpath(output_path+"/classes.jar")
    java_source = os.path.normpath(output_path+'/java_source')

    if (os.path.exists(input_path)):
        if (os.path.exists(output_path) == False):
            os.makedirs(output_path)
        apktool()
        enjarify()
        cfr()

        if (args.analysis):
            config = configparser.ConfigParser()
            config.read('regex.conf')
            regex_list = []
            for key in config['default']:
                regex_list.append(re.compile(config['default'][key]))
            staticcodeanalysis.search_code(output_path)

    else:
        print ("File doesn't exists. Check if you have provided the right path to the APK")