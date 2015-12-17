s
# Roman Numerals Project
Application to transform roman numerals to integers.

### Project Objective
Write a Ruby module to operate on roman numerals. Let's keep it all Ruby for now (instead of Rails), and use Rspec for testing.

### Follow these steps to submit your code:

1. Ask to have a folder created in the repo with your name.
1. [**Clone**](ref-clone) the repository to your computer.
1. Modify the files and [**commit**](ref-commit) changes to complete your solution (_in your folder_).
1. [**Push**](ref-push)/sync the changes up to GitHub.
1. [Create a **pull request**](pull-request) on the original repository to turn in the assignment.

---

### Phase 1 Objective
Write a Ruby module to transform roman numerals to integers.

#### Examples

VII -> 7  
XVI -> 16  
LX -> 60  

---

### Phase 2 Objective
Expand your program to also do the reverse, transform integers into roman numerals.

#### Examples

7 -> VII  
16 -> XVI  
60 -> LX  

---

### Phase 3 Objective
Download [3Hub](https://itunes.apple.com/us/app/3hub/id427515976?mt=12) or some other file viwer and configure with AWS credentials.

1. Use the CSV library to read some roman numerals from a file and transform them into integers. 
1. Read the file from a bucket in S3: (s3://sktraining.s3.amazonaws.com/roman_numerals/roman_numeral_sample.txt).
1. Write results to a file in a bucket in S3: (s3://sktraining.s3.amazonaws.com/roman_numerals/YOURNAME).

#### Sample Input File
VII  
IX  

#### Sample Output File
7  
9  

---

### Phase 4 Objective
1. Write a program that can perform math on roman numerals.
1. Read an input file of operations from S3 (s3://sktraining.s3.amazonaws.com/roman_numerals/roman_numeral_sample_operations.csv).
1. Write results to a file in a bucket in S3: (s3://sktraining.s3.amazonaws.com/roman_numerals/YOURNAME).

#### Sample Input File 
operator, operandA, operandB  
add, VI, IX  
divide, VI, III

#### Sample Output File  
XV  
II  
