#!/bin/bash

# Check if the number of arguments is exactly 1
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_Name> <file_name>"
    exit 1
fi

# Store the second argument in a variable
second_arg="$1"
third_arg="$2"
third_capit="${third_arg^^}_HPP"

# Get the current directory where the script is located
current_dir=$(pwd)

# Check if a directory with the same name already exists
if [ -d "$current_dir/$second_arg" ]; then
    echo "Error: Directory '$current_dir/$second_arg' already exists."
    exit 1
fi

# Create the directory
mkdir "$current_dir/$second_arg"
echo "Directory '$current_dir/$second_arg' created successfully."

# Create files inside the directory
# touch "$current_dir/$second_arg/main.cpp"
echo "#include <iostream>
#include \"$third_arg.hpp\"

int     main()
{
    

    return (0);
}
" >> "$current_dir/$second_arg/main.cpp"
#touch "$current_dir/$second_arg /Makefile"
echo "NAME	= 

CXX		= c++

CPPFLAGS	= -Wall -Werror -Wextra -std=c++98

SRC		= main.cpp $third_arg.cpp

OBJ		= \$(SRC:.cpp=.o)

RM		= rm -rf

all: \$(NAME)

\$(NAME): \$(OBJ) 
	\$(CXX) \$(CPPFLAGS) \$(SRC) -o \$(NAME)

clean:
	\$(RM) \$(OBJ)

fclean: clean
	\$(RM) \$(NAME)
	
re:	 fclean all

.PHONY:	all clean fclean re bonus" >>"$current_dir/$second_arg/Makefile"
#touch "$current_dir/$second_arg/${third_arg}.cpp"
echo "#include <iostream>
#include \"$third_arg.hpp\"
$third_arg::$third_arg()
{
	return;
}
$third_arg::$third_arg(<params>)
{
	return;
}
$third_arg::~$third_arg()
{
	return;
}
$third_arg    &$third_arg::operator=( $third_arg const & obj)
{
	return;
}
std::ostream &	operator<<(std::ostream & out, $third_arg & obj)
{
	return;
}


" >> "$current_dir/$second_arg/${third_arg}.cpp"
#touch "$current_dir/$second_arg/${third_arg}.hpp"
echo "#ifndef $third_capit
# define $third_capit
class $third_arg 
{
	private:

	public:
		$third_arg();
		$third_arg(<params>);
		~$third_arg();  
		
		$third_arg    &operator=($third_arg const & obj); 
		

};
std::ostream	&	operator<<(std::ostream & out, $third_arg & obj);
#endif" >> "$current_dir/$second_arg/${third_arg}.hpp"
echo "Files 'main.cpp', '${third_arg}.cpp', and '${third_arg}.hpp' created inside '$current_dir/$second_arg'."
