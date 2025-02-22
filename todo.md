# To Do:

## Important:
- [ ] Fix `make` command auto completion (It's due to the dynamic import of the `bash-encrypt` makefile in the root makefile). See [github.com/joepk90/terraform](https://github.com/joepk90/terraform) project.
- [ ] Investigate a completely different solution to Bash Encrypt? 😂 Bash doesn't seem qute suitable for this task. Perl? Or create a binary file from a more feature rich programming language? Or test external solutions?
- [ ] Make Sub Direcotry make file imports more elegant. Rather than relying on adding makefiles in sub directories that import the make file, make the `make` commands runnable anywhere. See [github.com/joepk90/terraform/blob/main/src/projects/serverless-apps/Makefile](https://github.com/joepk90/terraform/blob/main/src/projects/serverless-apps/Makefile) for an example of the problem.

---

## Potential Features:
- [ ] Make it possible to select a directory to unencrypt.
- [ ] Make it possible to just unencrypt the current working directory (when running `bash-encrypt` from a sub directory).
- [ ] Setup <b>*Bash Encrypt Store</b> (a file to track the state of encrypted and unencrypted files). This is so that secret files being worked on do not get encrypted during another process (i.e. `terraform apply`).
- [ ] Setup <b>*Advanced Git Configuration</b> - Make Git commands work automatically - This seems quite difficult...
- [ ] Make it possible to decrypt a files on open in vscode? (the <b>*Advanced Git Configuration</b> task would be better).
- [ ] Make the setup more elegent when being being run from child directories? Is this the same task as "Make Sub Direcotry make file imports more elegant"?
- [ ] Setup try/catch handler around middle commands that make use of bash-encrypt (i.e. `terraform apply`)? https://stackoverflow.com/questions/22009364/is-there-a-try-catch-command-in-bash




## Features

### *Advanced Git Configuration
Make Git commands work automatically. When committing an secret file, make it so you can commit it as unencryptd, but make the encryption automatic. Also make it so that decrypted secrets don't show up as dirty... basically make bash-encrypt functionality invisible.
  - [ ] make `git checkout` decrypt file?
  - [ ] make `git status` ignore decrypted file?
  - [ ] make `git commit` encrypt staged secret files?
  - [ ] add initialise make command which decrypts all files (but git won't notice due to the above requirements)

However this seems difficult... see the [git-encryption-example setup-git-command-hooks](https://github.com/joepk90/git-encryption-example/compare/main...setup-git-command-hooks) branch.


### *Bash Encrypt Store
Create a script ignores all unencrypted & dirty secrets files. make it so that when terraform plan/apply is run,
the unencrypted & dirty secrets files are left untouched... Might need to save a list to a file when all the files are decrypted?

- [ ] capture dirty/decrypted files in variable
- [ ] run custom command
- [ ] encrypt all files, then decrypt the captured dirty/decrypted files
- [ ] make command with call back?
  
  <b>Example Flow:</b>
  - export DECRYPTED_DIRTY_FILES=""
  - make decrype-all-files
  - make custom-command (terraform plan)
  - make encrypt-all-files
  - make decrypt-file-list DECRYPTED_DIRTY_FILES

---

## Completed Tasks:
- [x] fix git hooks import paths (hardcode path of utils directory when copying hook to .git directory...)
- [x] improve git configuration - make a new file, or append to an existing file
  - [x] use directory and instead just check if the import is in the main hook file
        git hook file? https://stackoverflow.com/questions/26624368/handle-multiple-pre-commit-hooks
- [x] make the bash directory it's own repo? - use git submodules - OR - make bash scriipts a bash package? https://github.com/bpkg/bpkg
 - [x] fix file path setup - "make-run-anywhere-testing" branch

  
