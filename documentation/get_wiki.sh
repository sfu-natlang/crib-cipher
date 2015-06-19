wget -O - https://en.wikipedia.org/w/api.php?action=query\&prop=extracts\&titles=$1\&format=xml | 
    xmlstarlet sel -T -t -c api |
    html2text |
    egrep -v "^#" |
    sed -e 's/[^a-zA-Z]/ /g' |
    tr '[:upper:]' '[:lower:]'|
    tr '\n' ' '|
    tr -s ' ' > $1.txt
