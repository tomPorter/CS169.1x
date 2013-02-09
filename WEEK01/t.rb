def mystery_sequence(start1, start2, limit=4)
  yield start1
  yield start2
  nextval = start1 + start2
  1.upto(limit) do
    yield nextval
    nextval, start2 = nextval + start2, nextval
  end
end
