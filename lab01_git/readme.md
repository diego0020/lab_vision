# Introduction to GIT

## Preparation

- Read about version control and Git (sections 1.1 - 1.4)  
  http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control 

## Basics

### Create a repository

1. Using the terminal create an empty directory 
2. Enter it, and run  `git init`  
   What happened?
3. Run `ls -al`, what do you notice?

### Modifying a repository

1. Create some *text* files inside the directory
2. Run `git status`. What is the output?
3. Run `git add <filename>` , and then `git status` again, what changed?
4. Run `git commit -m "created a file"`, what happened?
5. Run `git status` one more time.
6. Modify the file, and run `git status`
7. Run `git diff <filename>`, what is the output?
8. Run `git commit -a -m "changes to the file"`, what happens? What does the `-a` do?
9. Make more changes and commit them

### Review history

1. Run `git log`, what is the output?
2. Run `git diff <commit hash>`, what is the output?
3. Run `git checkout <commit hash>`, then look at the directory, what happened?
4. Run `git checkout HEAD`, what happened?


### Importan commands

- Init: Initialize a repository
- Status: Show current changes and staged files
- Commit: Write changes to repository
- Add: Add files to staging area
- Checkout: Move to another point in the tree
- Diff: Compare two points in the tree
- Log: Review history


## Working with multiple repositories

### Setup

Go into your GitHub account and create a new repository (green button at the right side). Don't initialize the repository, and in the next step say that you are importing an existing repository. Follow the instructions to link load your local repository into github.

### Pushing changes

1. Make some changes to the local repository and commit them.
2. Run `git push`. What happens?
3. Check your repository on GitHub

### Pulling changes

1. Make some changes to your project using the GitHub interface.
2. Run `git pull`. What happenes?

### Conflicts

1. Do some changes locally, commit them, but don't push.
2. Do some changes in GitHub and commit them.
3. Now try to push from your local copy, what happens?
4. Try to pull from your local machine, what happens?

### Clones and Forks

1. Go into the lab repository (https://github.com/diego0020/lab_vision) , and fork it (button at the top right), what happened?
2. In your machine run `git clone <github url>`, to clone your copy of the lab repository.
3. Run `git remotes`, what is the output?
4. Can you see the commit history?
5. Can you make changes?
6. Can you make upstream changes?

### Pull Request

If you don't have *push* permission to a repository, you can ask the owner to *pull* changes from your fork. This is called a pull requests. 

### Branches (Optional)

Branches lets you split work more efficiently, for example to develop different features independently or to work in teams. Branches can be created at any point, and can then be merged together, possibly requiring conflict resolution. 

- To create a branch run `git checkout -b <branch name>`
- To switch between branches use `git checkout <branch name>`
- To merge branches use `git merge`

## Github

GitHub is a web service that provides git on the cloud.

- It is free for open source projects.
- Provides a web based interface for several git tasks. Specially interesting
 - Blame
 - Diff
 - Branching
 - Pull Requests
- Makes collaboration easy
- Makes easy to contribute to open source projects
- An student package is available. It provies 10 free private repositories among other benefits   
  https://education.github.com/pack
 - Additional features:
 - Issue Tracker
 - GitHub Pages
 - Wiki
- Used by ... everyone...
 - Big companies (facebook, google, microsoft)
 - Small companies
 - Students
 - Professionals
 - Open Source Projects
 - Hobbyists
- Becomes part of your portfolio
- Usually tech companies will see your gitHub profile

GitHUB in IMAGINE presentation: https://goo.gl/xrSY6W


## Alternatives

- BitBucket
- GitLab

### How to use git in this lab
https://goo.gl/t65Ja5

## Graphical Clients

- GitHub for windows, mac
- Smartgit

See a more complete list at https://git-scm.com/downloads/guis


## Additional Resources

- XKCD  
  http://xkcd.com/1597/

- Just enough git to be less dangerous  
  http://eev.ee/blog/2015/04/24/just-enough-git-to-be-less-dangerous

- Interactive tutorial:  
  https://try.github.io

- Video:  
  http://youtu.be/lbLdbvIMHvw

- Short guide:  
  http://rogerdudler.github.io/git-guide/

- Long guide:  
  https://www.atlassian.com/git/tutorials/

- Highly technical guide:  
  http://git-scm.com/docs/gittutorial

- Friendly GitHub guide:  
  http://readwrite.com/2013/10/02/github-for-beginners-part-2

# HomeWork

1. Fork the lab repository (https://github.com/diego0020/lab_vision)
2. Open the *questions.md* file, and answer the questions
3. Commit the changes (answers) to your copy of the lab repository
4. Make sure that your answers are available at 
   `https://github.com/<USERNAME>/lab_vision/blob/master/lab01_git/questions.md` 
