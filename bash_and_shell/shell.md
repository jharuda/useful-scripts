# shell

## Archive data

### Archive

```
tar -czvf archiveName.tar.gz /path/to/folder/i/want/to/archive
```

### Unarchive

```
tar -xf archiveName.tar.gz
```

## RPM

### List all files in package:

```
rpm -ql <component>
```

### Info about package

```
rpm -qi <component>
```

### Print RPM that provides file

```
rpm -qf <file_in_filesystem>
```

### Check MD5 hash on source rpm

```
rpm -q --queryformat='%{SIGMD5}' -p diffutils-3.6-6.el8.src.rpm
```

## GUI

### Installing GUI to system

```
dnf groupinstall "Server with GUI"
systemctl isolate graphical.target
```

## BASHISM

```
echo "SHELL flags: ${-}" ; set | grep SHELLOPTS
```


