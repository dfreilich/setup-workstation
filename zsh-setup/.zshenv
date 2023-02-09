export GOPATH=$HOME/go
export GO111MODULE=on
export GONOSUMDB=gitlab.appsflyer.com
export GOPROXY="http://goproxy.appsflyer.com,https://proxy.golang.org,direct"
export PATH=/usr/local/go/bin:$GOPATH/bin:$PATH
export GOCMD=richgo
export JENKINS_USERNAME=david.freilich
export JENKINS_API_KEY=$(cat ~/.ssh/jenkins-token)
