function portkill -d "(╯°□°)--︻╦╤─ - - - kills all ports passed into func"
  for option in $argv
    set process (lsof -i :$option | grep LISTEN | awk '{ print $2 }')
    
    if test $process;
      kill $process;
    else;
      echo "nothing currently running on port $option"; continue;
    end;

    if test (lsof -i :$option | grep LISTEN | awk '{ print $2 }'); 
      echo "nothing currently running on port $option";
    else; 
      echo "killed port $option (pid: $process)";
    end;

  end;
end
