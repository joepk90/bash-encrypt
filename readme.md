# Bash Encrypt
The package uses bash and openssl to encrypt files. It is meant to be used within other projects.

To see an example of it being used see:
https://github.com/joepk90/git-encryption-example

## Project Setup

To install it, clone the repo to the project you want to use it, and then run the following commands to configure the project:
```
git clone git@github.com:joepk90/bash-encrypt.git
```

Mke the bash scripts executable:
```
make bash-scripts-configure
```

Then configure git pre commit hook. This will prevent unencrypted secrets from being committed:
```
make git-configure-hooks
```

Create an .env file in the root directory with the following text:
```
export ENCRYPTION_SEED="12345"
export SECRETS_EXT="secret"
```


## Configuration

### Salting (Randomisation)
The `openssl` configuratin uses `-nosalt` flag. This is to revent randomisation of the encypted ouput. This is to prevent the encrypted files from consitently changing so they don't need to be constantly re-added in git.

If randomisation is desired, use the `-salt` flag instead.

For more information see this thread:
https://askubuntu.com/questions/647404/why-hash-file-are-always-different-in-openssl-aes-256-cbc-output-files

It could be good to make this configurable option somehow...