package pipeline

import "core:sync/chan"
import "core:thread"


stage1 :: proc(chann: ^chan.Chan, nums: []int)
{
    for num in nums
    {
        // feed numbers into the channel for the other workers
        chan.send(chann, num)
    }
}

stage2 :: proc(chann: ^chan.Chan)
{
    // recv value from another worker through a channel
    value, ok := chan.recv(chann)
    
    // check if channel is still active
    if !ok {return}
    
    // transform value
    value *= value
    
    // send transformed value to next worker in the pipeline
    chan.send(chann, value)
}