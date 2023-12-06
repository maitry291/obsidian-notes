### Git

- Git is *Version control system* that allows multiple people to work on the same project simultaneously. Git is local to everyone's system. 
- Useful in managing code revisions, tracking changes, and coordinating work among multiple contributors.

### GitHub

- GitHub is a web-based platform that provides *hosting* for software development using Git.
- If developers use Git then it is very hard to collaborate as git is local. But using GitHub, we can create repository and collaborate easily.
- To collaborate with others, you need a remote repository hosted on a platform like GitHub, GitLab, or Bitbucket.
- Allows developers to host their Git repositories, collaborate with others, track issues, and manage project workflows.

>In summary, Git is the underlying version control system, while GitHub is a platform that utilizes Git for collaborative software development. There are other platforms similar to GitHub, such as GitLab and Bitbucket, each offering its own set of features and advantages. The choice between Git and GitHub depends on whether you need a version control system or a web-based platform for collaborative development, or both.

### Life-cycle of change in Git

We have our git repository(*Working directory*) where we do all changes. Other than this we have *Staging area* and committed changes area(*Local repository*). 

We make any change in repo. Now we have changes that are not yet tracked. To track the changes meaning to add changes in staging area, we use *git add* command. After tracking the changes, if we think changes are final then we can commit them using *git commit -m* command. 

### Log commands

- git log
- git log -n 5 -> Display a specific number of commits.
- git log -p
- git log --oneline -> Display each commit on a single line.
- git log --stat  -> Display detailed information for each commit, including the commit message, author, date, and changes.

**General**
- git restore fileName -> If we want to restore any file with respect to the current head(pointing to latest commit)

>Files to be ignored by git are added in .gitignore file. Ex- if we want to ignore all txt files then we can add a line * .txt in .gitignore file.

### Branch commands

- git branch name -> to create a new branch
- git checkout bname -> to switch to a branch
- git checkout -b bname -> creates and switches to a branch
- git merge -> to merge branches
- git commit -am "" -> add and commit together

>In Git, the `git stash` command is used to temporarily save changes that are not ready to be committed, allowing you to switch branches or perform other operations without committing incomplete work. The `git stash` command creates a stash, which is essentially a stack where you can store changes.

### Undo commits

- git commit --amend -> can change the latest commit description
- git revert commitId -> reverts the changes to given commit id
- git reset --x commitId -> x can be soft, mixed or hard. deletes all commits before given id.
soft won't remove the local changes of current commit, it will stage them in given id.
hard will delete all.

**Link Git local to GitHub**

![[Pasted image 20231206202638.png]]

GUI apps -> GitHub desktop, Sublime merge