kubectl config set-cluster k8s --server=https://35.221.84.16:6443 --insecure-skip-tls-verify=true \
&& kubectl config set-credentials jenkins --token=eyJhbGciOiJSUzI1NiIsImtpZCI6IkhxU2pFLVhEbTVlV0U1aWhNM1BUYXZ3ZGx1X0dfTUM4YnlrYXRTeFYyQ2cifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtdG9rZW4tY3E5eGgiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucyIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjMyZTI5YmZjLTBmMTgtNDU4NS05MTdlLWZlNmUxMjNlMjU1MyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmplbmtpbnMifQ.Xn7_QDrkmUndqGd1NDCOWFx5tNk4McX3XKK40cua2C39GPAWuP3UzbLGbCvoEeQFi_gW55e3s5xnhCYDJoppMzjXGthVViH6Ax0fAYshglqm7Rb7ROHBiaic21vs2oKl8QFcB8HwQbhv6FlVO8J8JtVX7FIVvYqbo-0ICR5JFmC5hxdS5KN2qxnTLymzoLB5WOfEZJwKT6ZPqnEHtgxR6I6JC9gihewNYorabCwaUL1DNOt6QY8b15eUBcq-HVColwjEzsxX1er44OZARnximLzjqE2bN1BU-4eDEZ-w1byaNxWB3Mr7ij6JCUa_2G0krAUDT6JDrGBLh07mFD1S-A \
&& kubectl config set-context default --cluster=k8s --user=jenkins \
&& kubectl config use-context default
helm package .helm
http -f DELETE http://10.174.0.12:8088/api/charts/${CONTAINER_IMAGE}/${CONTAINER_VERSION}
http -f POST http://10.174.0.12:8088/api/charts chart@${CONTAINER_IMAGE}-${CONTAINER_VERSION}.tgz --ignore-stdin