## android-sectools

This tools is developed with the idea of easy integration of Android code checks in to the Continuous Integration and Continuous Delivery CI/CD pipeline. This is achieved with the help of tools like apktool, enjarify and procyon-decompiler. Once the program has reverse engineered the APK file and placed the decompiled files into the output directory it perform a basic regex search against certain file types mentioned below,

> .java, .xml, .smali, .js, .ts, .py

### Installation 

Clone the repository and install python modules.

```
git clone https://github.com/vskram21/android-sectools.git
cd android-sectools
pip3 install -r requirements.txt 
```
The tool requires java and it picks the same from the environmental variables. So if `java -version` works in the command prompt than you are good.

### Usage 

#### To perform reverse engineering and basic static code analysis

This tool will pick the APK file from the input parameter, perform reverse engineering, does a regular expression(regex) based code(smali, java, xml, javascrit, typescript) matches against the files in output directory specified. 

```
python reverseengineer.py -i <path-to-apk> -o output/<output-directory>
```

To *disable analysis* and *only perform reverse engineering* you could add the flag *-a* to the above command.

#### Basic static code analysis only

If the use case is just to perform a static code analysis run the below command.

```
python staticcodeanalysis.py -i <path-to-analyse>
```

Be aware that the script currently looks for files with these extenstions .java, .xml, .smali, .js, .ts, .py. If you feel that more formats needs to be added you could simply copy paste the code after the *elif* statement in the method *search_code* and let me know so that I can add it to the script.

```
            elif file.endswith('.smali'):
                d1 = {'file':file, 'language':'smali'}
                file_search(d1,dirn,file)
```

The regex is picked from the config file *regex.conf* if you need to add a new regex just add it to the configuration file and you are good to go. By default the analysis are stored in a csv file in the output directory with the file name *results.csv*