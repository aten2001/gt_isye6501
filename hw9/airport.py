#!/usr/bin/env python3

# Useful links: https://www.youtube.com/watch?v=oJyf8Q0KLRY
import simpy 
import numpy as np

# Psudo Random Number Generator
PRNG = np.random.RandomState()  
PRNG.seed(39429)


def checkin_wait_time(env, checkin, personal_checkin):
    '''
    Determine the average wait time for someone trying to check into their
    flight

    INPUT:
        env: simpy environment
        checkin: int - number of people checking in customers
        personal_checkin: int - number of personal checkin machines

    OUTPUT: 
        average wait time in minutes
    '''
    assert ininstance(checkin, int)
    assert ininstance(personal_checkin, int)

    # how many arrived and when they arrived. 
    cust_arrived = PRNG.poisson(5)  # over last minute (scale=1)
    arrival_time = PRNG.exponential(scale = 0.2, size=cust_arrived)

    # Each checker takes exponetial w/ mean 0.75 minutes time


# Create a SimPy Enviornment
env = simpy.Environment()


class Simulation:

    def __init__(self):
        '''
        Initialize the simulation
        '''
        self.num_in_system = 0
        self.clock = 0.0
        self.t_arrival = self.interarrival()
        self.t_depart = float('inf')

        self.num_arrivals = 0
        self.num_departures= 0
        self.total_wait_time = 0.0

    def advance_time(self):
        '''
        Take a time step
        '''
        t_event = min(self.t_arrival, self.t_depart)
        self.total_wait += self.num_in_system * (t_event - self.clock)

        self.clock = t_event

        if self.t_arrival <= self.t_depart:
            self.arrival_event()
        else:
            self.depart_event()

    def arrival_event(self):
        '''
        Someone arives in the queue
        '''
        self.num_in_system += 1
        self.num_arrivals +=1
        if self.num_in_system <= 1:
            self.t_depart = self.clock + self.service()
        self.t_arrival = self.clock + self.interarrival()

    def departure_event(self):
        '''
        Someone finishes checking in for flight and leaves
        '''
        self.num_in_system -= 1
        self.num_departs += 1
        if self.num_in_system > 0:
            # Next person leaving at time ~
            self.t_depart = self.clock + self.service()
        else:
            # if no one is in the system then time is infinity 
            self.t_depart = float('inf')

    def interarrival(self):
        '''
        The time at which someone arrives
        '''
        # Rate of 5 a minute or lambda = 1/5 
        return PRNG.exponential(scale = 0.2) 

    def service(self):
        '''
        Checking people in servecing peeps
        '''
        # service of person is 0.75
        # service of machine is uniform between 0.5-1

s = Simulation()
print(s.t_arrival)
