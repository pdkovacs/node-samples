cookies_file=../build/output/cookies.txt
mkdir -p ../build/output

run_curl() {
    curl_command=$1
    printf "\n"
    echo $curl_command
    eval $curl_command
    printf "\n"
}

run_curl "curl -H \"Content-Type: application/json\" -X POST http://localhost:5000/login -d @clientAuth.json -i -c $cookies_file"
run_curl "curl -X GET http://localhost:5000/hello"
run_curl "curl --cookie $cookies_file -X GET http://localhost:5000/hello"
