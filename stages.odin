package pipeline

import "core:sync/chan"
import "core:thread"


stage1 :: proc(chann: ^chan.Chan, nums: []int)
{
    for num in nums
    {
        assert(chan.send(chann, num))
    }
}