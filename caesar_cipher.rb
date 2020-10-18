isUpper = false;
upper_bound = 0;
lower_bound = 0;

def letter?(character)
    character =~ /[A-Za-z]/
end

def upper?(character)
    character =~ /[A-Z]/
end

def caesar_encrypt(string, shift)

    #Convert shift input from string to int
    shift = shift.to_i

    characters = string.split("")

    characters.each_with_index do |char, i|
        #Ignore non-letter characters in the string
        if letter?(char) 
            #Convert character into it's ASCII value
            ord = char.ord

            #Shift character
            ord += shift

            #Find upper and lower bounds in case of wrapping
            if upper?(char) 
                upper_bound = 90
                lower_bound = 65
            else
                upper_bound = 122
                lower_bound = 97
            end

            #Apply wrap if necesarry
            ord -= 26 if ord > upper_bound
            ord += 26 if ord < lower_bound

            #Update string array
            characters[i] = ord.chr
        end
    end

    #Build a string from the shifted array and return it
    return characters.join("")
end

#Get input
input_string = gets.chomp
input_shift = gets.chomp

puts caesar_encrypt(input_string, input_shift)