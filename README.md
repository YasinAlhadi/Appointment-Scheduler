<img src="postgresql-original.svg" height="40" width="40"/>  <img src="bash-original.svg" height="40" width="40"/>

# Appointment Scheduler

## Description

A simple interactive Bash program that uses PostgreSQL to track the customers and appointments.

## Usage

### Setup
1. Install PostgreSQL
2. clone this repository to your local machine and cd into it
```bash
https://github.com/YasinAlhadi/Appointment-Scheduler.git
cd Appointment-Scheduler
psql -U postgres < salon.sql
./salon.sh
```

### Example
```
~~~~~ Golden Scissor Salon ~~~~~

Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim
10

I could not find that service. What would you like today?
1) cut
2) color
3) perm
4) style
5) trim
1

What's your phone number?
123-456-7891

I don't have a record for that phone number, what's your name?
Yasin

What time would you like your cut, Yasin?
10:30

I have put you down for a cut at 10:30, Yasin.


// Next example:

~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim
2

What's your phone number?
123-456-7891

What time would you like your color, Yasin?
11am

I have put you down for a color at 11am, Yasin.
```

## technologies used
- PostgreSQL
- Bash