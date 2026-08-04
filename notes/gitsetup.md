# git setup

  Clone Repository
      ↓
Open in VS Code
      ↓
Edit Code
      ↓
Save
      ↓
git status
      ↓
git add .
      ↓
git commit
      ↓
git push
      ↓
GitHub Updated ✅

open git bash 
in you local computer create a projects folder then inside that
go to github webisite click on green code but copy link
it should look like this https://github.com/BhanuPrasanna23/gcp-data-engineer-journey.git
now in git bash open that folder projects
run $ git clone https://github.com/BhanuPrasanna23/gcp-data-engineer-journey.git
you should see something like this
Cloning into 'gcp-data-engineer-journey'...
remote: Enumerating objects: 63, done.
remote: Counting objects: 100% (63/63), done.
remote: Compressing objects: 100% (54/54), done.
remote: Total 63 (delta 18), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (63/63), 22.07 KiB | 2.01 MiB/s, done.
Resolving deltas: 100% (18/18), done.

Bhanu@DESKTOP-LNV65TR MINGW64 ~/Documents/Projects
$ ls
gcp-data-engineer-journey/

Bhanu@DESKTOP-LNV65TR MINGW64 ~/Documents/Projects
$ cd gcp-data-engineer-journey

Bhanu@DESKTOP-LNV65TR MINGW64 ~/Documents/Projects/gcp-data-engineer-journey (main)
$ pwd
/c/Users/ADMIN/Documents/Projects/gcp-data-engineer-journey

then move to vscode use ctrl + ` to open new terminal 
go to projects/gcp folder there run code .
it should open your repository
again open terminal 
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git pull
Already up to date.
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git status
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   sql/day01_customers.sql

no changes added to commit (use "git add" and/or "git commit -a")
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git add . 
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   sql/day01_customers.sql

PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git commit -m "Update Day 1 SQL practice notes on select/where/orderby/limit"
Author identity unknown

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'Bhanu@DESKTOP-LNV65TR.(none)')
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git config --global user.email "bhanu123prasanna@gmail.com"
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git config --global user.name "Bhanu Prasanna Meka"
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git config --global --list
user.email=bhanu123prasanna@gmail.com
user.name=Bhanu Prasanna Meka
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git commit -m "Update Day 1 SQL practice notes on select/where/orderby/limit"
[main 7343eb7] Update Day 1 SQL practice notes on select/where/orderby/limit
 1 file changed, 98 insertions(+)
PS C:\Users\ADMIN\Documents\Projects\gcp-data-engineer-journey> git push
info: please complete authentication in your browser...
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 8 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 1.16 KiB | 298.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/BhanuPrasanna23/gcp-data-engineer-journey.git
   e58536b..7343eb7  main -> main

 