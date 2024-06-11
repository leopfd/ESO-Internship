fileList=$(basename ~/ESO/Final_fits_APEX/*)

oldobject="notset"
oldsourcename="notset"

for file in $fileList
do
 echo $()
 object=$(basename $file | sed 's/_A/XXX/' | cut -f 1 -d '_' | sed 's/AA.fits//' | sed 's/A.fits//' | sed 's/.fits//' | sed 's/XXX/_A/')
 sourcename=$(basename $file | sed 's/.fits//')
 echo $oldobject
 echo $oldsourcename
 echo $object
 echo $sourcename
 echo $(basename $file)
 $(mv ../Final_fits_APEX/$file ~/ESO/staging_area/)
 $(read -p "Press any two keys to continue... " -n2)
 echo $()
 #$(open http://archive.eso.org/wdb/wdb/eso/apex/form)
 #$(read -p "Press any two keys to continue... " -n2)
 #echo $()
 echo $(sed -i0 "s/$oldobject/$object/" apex_ph3_spec.py)
 echo $(sed -i0 "s/$oldsourcename/$sourcename/g" prep.class)
 $(./apex_ph3_spec.py >> apex_ph3_spec.log)
 $(read -p "Run CLASS script and main script then press three keys... " -n3)
 echo $()
 #$(python3 APEXspecTool-Ph3.py)
 $(mkdir ../shipping_area/$object)
 $(mv ../staging_area/$object* ../shipping_area/$object)
 $(mv ../staging_area/*Ph3.* ../shipping_area/$object)
 oldobject="$object"
 oldsourcename="$sourcename"
 $(read -p "If finished type done... " -n4)
 echo $()
done

echo $(sed -i0 "s/$oldobject/notset/" apex_ph3_spec.py)
echo $(sed -i0 "s/$oldsourcename/notset/g" prep.class)
