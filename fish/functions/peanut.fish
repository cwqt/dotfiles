# Defined in - @ line 0
function peanut --description alias\ peanut=wget\ -q\ -o\ /dev/null\ \(wget\ -q\ -o\ /dev/null\ \"comm-and.tumblr.com/api/read/\?type=photo\&num=50\"\ -qO\ -\ \|\ ggrep\ -oP\ \"photo-url\ max-width=\\\"1280\\\"\>.\*\?\</photo-url\"\ \|\ ggrep\ -oP\ \"https://.\*\?\\.\(png\|jpg\|gif\)\"\ \|\ gshuf\ -n\ 1\)\ -qO\ peanut\;\ img2txt\ -d\ none\ --width\ \(stty\ size\ \|\ grep\ -o\ \"\\s.\*\"\)\ -x6\ -y\ 12\ -g\ 0.6\ peanut
	wget -q -o /dev/null (wget -q -o /dev/null "comm-and.tumblr.com/api/read/?type=photo&num=50" -qO - | ggrep -oP "photo-url max-width=\"1280\">.*?</photo-url" | ggrep -oP "https://.*?\.(png|jpg|gif)" | gshuf -n 1) -qO peanut; img2txt -d none --width (stty size | grep -o "\s.*") -x6 -y 12 -g 0.6 peanut $argv;
end
