# Bash Encrypt
The package uses bash and openssl to encrypt files. It is meant to be used within other projects.

To see an example of it being used see:
https://github.com/joepk90/git-encryption-example


## Project Setup

Clone the repo to your project
```
git clone git@github.com:joepk90/bash-encrypt.git
```

Or clone it as a submodule if you want to contribute
```
git submodule add git@github.com:joepk90/bash-encrypt.git
```

imported the Makefile commmands by including the following line at the top of your projects root Makefile:
```
include ./bash-encrypt/Makefile
```

Make the bash scripts executable:
```
make bash-scripts-configure
```

Then configure git pre commit hook. This will prevent unencrypted secrets from being committed:
```
make git-configure-hooks
```

Create an .env file in the root directory with the following text:
```
export BASH_ENCRYPT_SEED="12345"
export BASH_ENCRYPT_SECRETS_EXT="secret"
```


## Configuration

### Salting (Randomisation)
The `openssl` configuratin uses `-nosalt` flag. This is to revent randomisation of the encypted ouput. This is to prevent the encrypted files from consitently changing so they don't need to be constantly re-added in git.

If randomisation is desired, use the `-salt` flag instead.

For more information see this thread:
https://askubuntu.com/questions/647404/why-hash-file-are-always-different-in-openssl-aes-256-cbc-output-files

It could be good to make this configurable option somehow...