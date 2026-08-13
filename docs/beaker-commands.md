# beaker-commmands


## Examples of the wow command

The wow command is RedHat internal tool for creating Beaker XML jobs and schduling them
in Beaker.

### Schedule a job only on some architecture (rhel can be rhel-10)

```
wow --arch s390x <rhel>
```

More architectures are separated by a comma

### Schedule a job on all architectures

```
wow <rhel>
```

### Install a specific official build 

```
--brew-build="$BUILD" --brew-method=multi --taskparam=VERSIONLOCK=true
```

An example: `postgresql-16-9060020250224074311.rhel9`

- BUILD = systemd-252-55.el9_7.4
- --brew-method=multi --taskparam=VERSIONLOCK=true - it is always present

### Install a specific scratch build 

```
--brew-task=${TASK_ID} --brew-method=multi --taskparam=VERSIONLOCK=true
```

Note: TASK ID is not the same as BUILD_ID. Both of them can be found in Build system.

- `--brew-method=multi --taskparam=VERSIONLOCK=true` - it is always present

### Request only BIOS machines

```
--keyvalue="NETBOOT_METHOD!=efigrub"
```

### Request only UEFI machines

```
--hostrequire='<or><key_value key="NETBOOT_METHOD" op="==" value="efigrub"/><key_value key="NETBOOT_METHOD" op="==" value="grub2"/></or>'
```

- An XML representation of a filter

### Request only virtual machines

```
--virtual
```

### Request only bare metal machines

```
--bare --keyvalue=HVM=1
```

### Request a machine with 2 or more disks

```
--keyvalue="NR_DISKS>1"
```

### Batch scheduling

```
IMAGE=rhel-9                        ;
COMPONENT=postgresql                ;
TESTNAME=Sanity/basic-functionality ;
BRANCH="master"                     ;
wow "$IMAGE" --note "${IMAGE} - ${COMPONENT} with the test ${TESTNAME} on branch ${BRANCH}" --ks-meta="redhat_ca_cert" --task "<BUILD_SYSTEM_URL>/cgit/tests/${COMPONENT}/snapshot/${COMPONENT}-${BRANCH}.tar.gz#${TESTNAME}"
```

- `--note` - stands for a description in a Beaker Web UI
- `--ks-meta=redhat_ca_cert` - installs an RH certificate, it is required for https in a --task step
- `--task` - specifies an action to perform by a Beaker, in this case running a test 


### Executing a command in a Beaker, you can use multiple time

```
--task "! lsblk"
```

### Return a machine to a Beaker

```
return2beaker.sh
```

### Extend reservation time

```
extendtesttime.sh 99
```

### Set retetion for Beaker job

```
bkr job-modify --retention-tag=audit --product="[internal]" J:<JOB_ID>
```