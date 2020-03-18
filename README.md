# breachfind
Simple script to manage findings and evidences from downloaded data breaches

## Getting Started
Useful if you quickly need to find emails or domains of your org. inside tons of files & dirs, breachfind simply count occurrences or creates different TXT files ouputs based on your search. If you have mixed files (eg. rars and txts) you can also enumerate compressed files for manually uncompress them and do the job.

### Usage

```
./breachfind.sh {-p|-w|-c}
  -p   : print only (global count)
  -w   : write results in TXT's
  -c   : check for compressed files (rar|zip|7z|gz|tar|tgz)
```
