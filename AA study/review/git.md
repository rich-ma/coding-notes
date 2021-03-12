# Git
- Git is a version control system
	- allows us to keep a log of changes made to a project
	- revert to project back to previous state

- allows us to develop as a team
- separete our work from others using branches(private copy of the main branch that can be merged back together)

## How git stores things
- git stores data as a series of snapshots
- everytime you make a commit, or store data, git takes a snapshot of all the changes and stores a reference to that snapshot
- stream of snapshots is what makes Git different from other VCSs.
- git performs most operations locally
![git](https://git-scm.com/book/en/v2/book/05-distributed-git/images/centralized_workflow.png)
- git is distributed but centralized, what does this mean?
  - a master copy of each repo lives remotely, usually on github, each contributor also keeps a copy of the repo and its version history locally
  - we can look through our local repo for history without having to fetch from the server everytime
  - only when we watch or push or fetch updates do we have to go to github.

## Three stages of git
![git stages](https://git-scm.com/book/en/v2/book/01-introduction/images/areas.png)

- files live in three different states, modified, staged, and committed.
- workflow goes like this:
	1. you make changes to your local repo(working directory), files are now **modified**
	2. you decide which files you want to add to your next commit and add them to the staging area.  Files are now **staged**.  If you don't want a change to be committed, don't stage it.
	3. you commit all of the files in your staging area and create a snapshot that lives permanently in your local Git directory.  Files are now **committed**
- this all happens locally, not pushed to git yet.

# Git summary

- git init: initiates a git repository at your current location
- git status: shows you what files have been modified and not staged yet, and what files are untracked
```ruby
~/aa/ruby-curriculum$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#       modified:   README.md
#       modified:   git.md
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#       git-summary.md
no changes added to commit (use "git add" and/or "git commit -a")
```
- git add:(ga) use this to add files to staging
  - when you git add a file, the next time you commit, it will save to the repo
  - ga only adds changes you've made up to that point.  If you make changes before you commit, those new changes won't be updated unless you git add again.
```ruby
~/aa/ruby-curriculum$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#       modified:   README.md
#       modified:   git.md
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#       git-summary.md
no changes added to commit (use "git add" and/or "git commit -a")
~/aa/ruby-curriculum$ git add git.md
~/aa/ruby-curriculum$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#       modified:   git.md
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#       modified:   README.md
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#       git-summary.md
```
- git commit: will save the work staged from git add into the history by creating a new checkpoint that you can return to later.
  - commit frequently! don't try to commit until you've written half the program
  - everytime you make a major change you shoudl commit
  - **git reset**: use this to reset to a previous commit if you made a mistake

# Additional resources

## Aliases
- alias is a shell command that enables to replacement of a word with another string
- not git specific, but for terminal use


### Creating an alias
- open your shell's configuration file
- .bashrc, or .bash_profile, etc.

```bash
alias gcm='git commit -m'
```
- this will allow us to type gcm, instead of git commit -m/master. 
- 

# git cheatsheet
http://www.ndpsoftware.com/git-cheatsheet.html
