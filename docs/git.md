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

### Download:

```
git fetch -v
git fetch -v up
```

### Add up to my branch (for example master):

```
git branch -v -u up/master
```

### Download from the upstream:

```
git fetch
```

### Push it to my fork

```
git push -u origin <branch_name>
```

#### And downloading chagnes from the upstream:

```
git fetch up; git pull --rebase
```

### No certificate:
```
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
