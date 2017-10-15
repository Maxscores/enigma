"""
we have date, convert to date_code => a_date, b_date, c_date, d_date
we have last 7 characters '..end..' => 38,38,5,14,4,38,38
key a, b, c, d = (encrpyted_char - known_char - date_code)
need to figure out which characters of '..end..' are
  set for a=(%4=1), b=(%4=2), c=(%4=3), d=(%4=0)

offset = key + date
encrypted_value = char_value + key + date_code
key = encrypted_value - char_value - date_code
