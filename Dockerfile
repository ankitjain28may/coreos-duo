FROM alpine:latest

ENV IKEY=${IKEY}
ENV SKEY=${SKEY}
ENV HOST=${HOST}
ENV COREOS_VERSION=${COREOS_VERSION}

RUN mkdir -p "pam_duo_configure"

WORKDIR /pam_duo_configure

COPY . .
COPY --from=quay.io/razorpay/coreos-duo:2135.6.0 /duo/lib64/security/pam_duo.so /pam_duo_configure/pam_duo-2135.6.0/pam_duo.so
COPY --from=quay.io/razorpay/coreos-duo:2135.5.0 /duo/lib64/security/pam_duo.so /pam_duo_configure/pam_duo-2135.5.0/pam_duo.so
COPY --from=quay.io/razorpay/coreos-duo:2079.6.0 /duo/lib64/security/pam_duo.so /pam_duo_configure/pam_duo-2079.6.0/pam_duo.so
COPY --from=quay.io/razorpay/coreos-duo:2023.5.0 /duo/lib64/security/pam_duo.so /pam_duo_configure/pam_duo-2023.5.0/pam_duo.so
COPY --from=quay.io/razorpay/coreos-duo:1967.6.0 /duo/lib64/security/pam_duo.so /pam_duo_configure/pam_duo-1967.6.0/pam_duo.so
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]