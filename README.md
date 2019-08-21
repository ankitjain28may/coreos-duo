# CoreOS-Duo

Run the following command to install duo in CoreOS.

1. Add Duo credentials in the `duo.env` with CoreOS version.

2. Run this command inside the CoreOS.

```shell
    docker run --rm \
    --volume /etc/pam_duo/lib64:/etc/pam_duo \
    --volume /etc/duo:/duo \
    --volume /etc/ssh:/etc/ssh \
    --volume /etc/pam.d:/pam.d \
    --env-file duo.env \
    ankitjain28/coreos-duo:{TAG}
```
