@dir = "/var/app"

worker_processes 2 
working_directory @dir

timeout 300
listen 8080

pid "#{@dir}/unicorn.pid" 

stderr_path "/var/log/unicorn.stderr.log"
stdout_path "/var/log/unicorn.stdout.log"
