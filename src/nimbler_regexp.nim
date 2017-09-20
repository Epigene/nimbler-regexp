import nre

proc is_regexp_match*(string_to_match: string, regex_string: string): bool {.cdecl, exportc} =
  false
#   if n < 2: 1
#   else: fibonacci(n-2) + fibonacci(n-1)


#  /pat/i - Ignore case
# echo "ABC".contains(re"(?i)^[a-z]+$") # insensitive

#  /pat/m - Treat a newline as a character matched by .
# echo "foo_bar\nbaz".contains(re"(?m)(?s)^foo.*baz$") # multiline

#  /pat/x - Ignore whitespace and comments in the pattern
# float_pat.inspect
# => "/\\A\n[[:digit:]]+ # 1 or mor\n(\\.          # Decimal p\n        [[:digit:]]+ # 1 or more digi\n   )? # The decimal \n\\Z/x"
# echo "3.14".contains(re"\\A\n[[:digit:]]+ # 1 or mor\n(\\.          # Decimal p\n        [[:digit:]]+ # 1 or more digi\n   )? # The decimal \n\\Z")

#  /pat/o - Perform #{} interpolation only once
# NOT RELEVANT IN
