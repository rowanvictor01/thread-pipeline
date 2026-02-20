package pipeline

import "core:thread"
import "core:sync/chan"
import "core:fmt"


spawn_workers :: proc(fns: []proc(t: ^thread.Thread)) -> ([dynamic]^thread.Thread, bool)
{
    if len(fns) != 3
    {
	fmt.println("[ERROR]: len of dynamic array of procedures should be 3")
	return nil, false
    }
    // store threads here
    threads: [dynamic]^thread.Thread

    // create channels
    chann: chan.Chan
    chann_map: map[int]chan.Chan  // defer delete

    for i in 0 ..< 3
    {
	if i < 2
	{
	    chann, err := chan.create_unbuffered(chan.Chan(int), context.allocator)  // defer delete
	    assert(err == .None, "[ASSERT]: channel init error")
	    chann_map[i + 1] = chann
	}

	t := thread.create(fns[i])  // defer delete
	assert(t != nil, "[ASSERT]: thread var is nil")

	// Second thread will need chann 1 for comms with worker 1 and chann 2 for worker 2
	if i == 1
	{
	    t.data = &chann_map
	}
	else
	{
	    t.data = &chann
	}

	append(&threads, t)
    }
    
    return threads, true
}
