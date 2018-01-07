def execute_with_log(context)
  p "Task #{context} started"
  yield
  p "Task #{context} finished"
end

execute_with_log('do things') { p 'Doing things'}

execute_with_log('do stuff') { p 'Doing stuff'}  
