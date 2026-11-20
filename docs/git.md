# GIT

## How to use forks

```
git clone git@gitlab.cee.redhat.com:<group>/<repository>.git
```

## Add upstream:

```
git remote add up git@gitlab.cee.redhat.com:<group>/<repository>.git
```

## List remote branches with links

```
git remote -v
```


## Branches

### Checkout

#### Create a new branch

```
git checkout -b <new_branch_name>
```

#### Checkout current branch

```
git checkout <branch_name>
```

#### Delete branch

```
git checkout master
git branch -D <branch_name>
git push -u origin :<branch_name>
```

### List branches including remote

```
git branch -ar
```

### Download remote code

```
git fetch -v
git fetch -v up
```

### Add up to my branch (for example master):

```
git branch -v -u up/master
```

### Push it to my fork

The option `-u` is the same as `--set-upstream`. For `--force` push also add the option `-f`.

```
git push -u origin <branch_name>
```

#### And downloading chagnes from the upstream:

```
git fetch up; git pull --rebase
```

### No certificate:

```
git clone -c http.sslVerify=false https://github.com/jharuda/useful-scripts

# or globally

git config --global http.sslVerify false
```

### Change GIT remote from `https` to `ssh`

```
git remote set-url origin git@gitlab.com:<group>/<repository>
```

### Checkout specific MR

```
git fetch origin merge-requests/REQUESTID/head:BRANCHNAME
```
