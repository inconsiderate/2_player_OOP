

def method(n)
  if n < 2
    return 1
  else
    return n * method(n-1)
  end
end


def pally(string)
  if string.length == 2
    string[0] == string[1]
  elsif string.length == 1
    return true
  else
    pally(string[1..-2]) && (string[0] == string[-1])
  end
end


def fibb(position)
  if position < 2
    return 1
  else
    return fibb(position-1) + fibb(position-2)
  end
end


puts fibb(41)