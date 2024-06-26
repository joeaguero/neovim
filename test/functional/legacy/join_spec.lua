-- Test for joining lines

local t = require('test.testutil')
local n = require('test.functional.testnvim')()

local clear, eq = n.clear, t.eq
local eval, command = n.eval, n.command

describe('joining lines', function()
  before_each(clear)

  it('is working', function()
    command('new')
    command([[call setline(1, ['one', 'two', 'three', 'four'])]])
    command('normal J')
    eq('one two', eval('getline(1)'))
    command('%del')
    command([[call setline(1, ['one', 'two', 'three', 'four'])]])
    command('normal 10J')
    eq('one two three four', eval('getline(1)'))
  end)
end)
