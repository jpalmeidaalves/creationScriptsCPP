#!/bin/bash

# Check if the number of arguments is exactly 1
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <class_name>"
    exit 1
fi

# Store the second argument in a variable
second_arg="$1"
second_capit="${second_arg^^}_HPP"
current_dir=$(pwd)

#touch "$current_dir/$second_arg/${second_arg}.cpp"
echo "#include <iostream>
#include \"$second_arg.hpp\"
$second_arg::$second_arg()
{
	return;
}
$second_arg::$second_arg(<params>)
{
	return;
}
$second_arg::~$second_arg()
{
	return;
}
$second_arg    &$second_arg::operator=( $second_arg const & obj)
{
	return;
}
std::ostream &	operator<<(std::ostream & out, $second_arg & obj)
{
	return;
}" >> "$current_dir/${second_arg}.cpp"

#touch "$current_dir/$second_arg/${second_arg}.hpp"
echo "#ifndef $second_capit
# define $second_capit
class $second_arg 
{
	private:

	public:
		$second_arg();
		$second_arg(<params>);
		~$second_arg();  
		
		$second_arg    &operator=($second_arg const & obj); 
		

};
std::ostream	&	operator<<(std::ostream & out, $second_arg & obj);
#endif" >> "$current_dir/${second_arg}.hpp"