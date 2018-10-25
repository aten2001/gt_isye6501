#!/usr/bin/python3

'''
useful Links:'
0. https://simpy.readthedocs.io/en/latest/api_reference/simpy.resources.html
1. https://simpy.readthedocs.io/en/latest/topical_guides/monitoring.html
'''

import simpy
import numpy as np

PRNG = np.random.RandomState()
PRNG.seed(1738)  # squaw

env = simpy.Environment()
self_serv = simpy.Resource(env, capacity=8)
serv_ppl = simpy.Resource(env, capacity=6)
wait_times = []

def checkin_boi(env, resource1, resource2, arrival_time, wait_times):
    # arriving at the air port
    yield env.timeout(arrival_time)
    t1 = env.now

# assuming equal amount of resources for each of these. 
# There is probably a better way to select if one should have a longer queue or
# not but keeping their size about even should be fine because if one moves
# faster it will have more people flow into its queue to keep the numbers even
    if len(resource2.queue) > len(resource1.queue):
        # Request one of its charging spots
        with resource1.request() as req:
            yield req

            # Person checking in at self service portal
            #print('%s starting to charge at %s' % (name, env.now))
            checkin_duration = PRNG.exponential(scale=0.75)
            yield env.timeout(checkin_duration)
            t2 = env.now
            wait_times.append(t2-t1)
    else:
        # Request one of its charging spots
        with resource2.request() as req:
            yield req

            # Person checking in at self service portal
            #print('%s starting to charge at %s' % (name, env.now))
            checkin_duration = PRNG.uniform(low=0.5, high=1.0)
            yield env.timeout(checkin_duration)
            t2 = env.now
            wait_times.append(t2-t1)

# Want to have enough people to have a strong average. 
people_checking_in = range(750)
arrival_time = 0.0
for each_person in people_checking_in:
    env.process(checkin_boi(env, self_serv, serv_ppl, arrival_time, wait_times))
    arrival_time += PRNG.exponential(scale=1./50)
    # arrival_time += PRNG.exponential(scale=0.2)  # 5 per minute

env.run()
print("mean wait time: ", round(np.mean(wait_times)))

