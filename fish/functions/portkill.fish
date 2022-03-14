function portkill -d "(╯°□°)--︻╦╤─ - - - kills all ports passed into func"
  for option in $argv
    set stdout (lsof -i :$option | grep LISTEN)
    set process (echo $stdout | awk '{ print $2 }')
    set name (echo $stdout | awk '{ print $1 }')
    
    if test $process;
      kill -9 $process;
    else;
      echo "nothing currently running on port $option"; continue;
    end;

    if test (lsof -i :$option | grep LISTEN | awk '{ print $2 }'); 
      echo "nothing currently running on port $option";
    else; 
      echo "killed $name (pid: $process)";
    end;

  end;
end
