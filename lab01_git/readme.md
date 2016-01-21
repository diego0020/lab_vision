# Introduction to GIT

## Preparation

- Read about version control and Git (sections 1.1 - 1.4)  
  http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control 

## Basics

### Create a repository

1. Using the terminal create an empty directory 
2. Enter it, and run  `git init`  
   What happened?
3. Run `ls -l`, what do you notice?

### Modifying a repository

1. Create some *text* files inside the directory
2. Run `git status`. What is the output?
3. Run `git add <filename>` , and then `git status` again, what changed?
4. Run `git commit -m "created a file"`, what happened?
5. Run `git status` one more time.
6. Modify the file, and run `git status`
7. Run `git diff <filename>`, what is the output?
8. Run `git commit -a -c "changes to the file"`, what happens? What does the `-a` do?
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

- Pull
- Push
- Clone
- Fork
- Pull Request

## Branches

- Create
- Merge

## Github

- Students
- Profesional
- Portfolio

## Graphical Clients

## Additional Reading



## Additional Resources

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
