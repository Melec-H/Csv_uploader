# Comments:
## Notation criteria:
### The readability of the code : 1/5
  - all your variable names are wrong and too long. We don't understand what it IS upon reading its name
  - all your method names are wrong and too long. We don't understand what it DOES upon reading its name
  - boolean values should be booleans, not strings
  - too much spaec between lines (take a look at: https://github.com/rubocop-hq/ruby-style-guide) - not for this particular programming language. would you write methods with a space between each lines in another language ?


### The flexibility of the code : 2/5
This criteria is hard to be evaluated as there is not much code in there but here are my comments:
  - too much code to change if I want to check on a new attribute - your code is not smart
  - there are no test but that would be the same
  - a method with such long method names and such long variable names is not maintainable by another member of the team


### The global performance of the import : couldn't be tested
See `general comments`. Couldn't be evaluated because your code does not answer to the problem.

### Tests : 0/5
You wrote no test. It was an evaluation criteria.

## General comments:
Your code does not answer to the exposed problem.
### What you have done:
  - Write the import of csv files

### What you have not:
 - Update the attribute only if has never been an attribute of the object: never have you used an update, you create new records in the db at each iteration. 
 - or if the value is a value that has been changed by hand: never did you check this condition nor implemented any sort of mechanism that does.
- Write tests for the whole app