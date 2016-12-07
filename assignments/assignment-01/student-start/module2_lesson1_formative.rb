some_var = "false"
another_var = "nil"

case some_var
	when "pink elephant" then puts "Don't think about the pink elephant!"
	when another_var.nil? then puts "Question mark in the method name?"
	when false then puts "Looks like this one should execute"
	else 
		puts "I guess nothing matched... But why?"
end

# $rspec
# .....
# Finished in 0.009 seconds (files took 0.49003 seconds to load)
# 5 examples, 0 failures