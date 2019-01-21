import io
import re

def process_guard_times(shift):
    internal_counter = 0
    guard_match = re.search(r'#([0-9]*)', shift[0])
    activeGuard = int(guard_match.group(1))
    counter = 1
    counter_start = 0
    while counter < len(shift):
        line = shift[counter]
        fall_asleep_re = re.search(r':([\d]*)] falls', line)
        if fall_asleep_re:
            minute_asleep = int(fall_asleep_re.group(1))
            counter_start = minute_asleep

        wake_up_re = re.search(r':([\d]*)] wakes', line)
        if wake_up_re:
            minute_awake = int(wake_up_re.group(1))
            guard = guardDB.get(activeGuard)
            if not guard:
                guard = {}
                guardDB[activeGuard] = guard
            for minute in range(minute_asleep, minute_awake):
                if guard.get(minute):
                    guard[minute] = guard[minute] + 1
                else:
                    guard[minute] = 1
        counter += 1

def get_dictMax(dictionary):
    biggestValue = 0
    biggestKey = 0
    for key in dictionary.keys():
        if dictionary[key] > biggestValue:
            biggestValue = dictionary[key]
            biggestKey = key
    return biggestKey

def calc_guard_sleep(guardId):
    guard = guardDB[guardId]
    total = 0
    for key in guard.keys():
        val = guard[key]
        total += val
    return total

def get_sleepiest_guard():
    sleepTime = -1
    sleepyGuard = -1
    for guardId in guardDB.keys():
        sleepTotal = calc_guard_sleep(guardId)
        if sleepTotal > sleepTime:
            sleepTime = sleepTotal
            sleepyGuard = guardId
    return sleepyGuard

with io.open("day4input.txt", "r", encoding='utf-8') as f:
    lines = f.readlines()
lines.sort()

guardDB = {}
prev_counter = -1
counter = 0
shifts = []
while counter < len(lines):
    line = lines[counter]
    shift_start_re = re.search(r'Guard #[0-9]* begins shift', line)
    if shift_start_re:
        shift = lines[prev_counter:counter]
        if counter != 0:
            shifts.append(shift)
        prev_counter = counter
    counter += 1

for shift in shifts:
    process_guard_times(shift)

# sleepiest_guard = get_sleepiest_guard()
# print(sleepiest_guard)
# sleep_record = guardDB.get(sleepiest_guard)
# sleepiest_minute = get_dictMax(sleep_record)
# print(sleepiest_minute)
# print(sleepiest_guard * sleepiest_minute)

sleepiest_minute_db = {}
for guardId in guardDB.keys():
    sleep_record = guardDB.get(guardId)
    sleepiest_minute = 0
    for minute in sleep_record(minute)
    sleepiest_minute_db[guardId] = sleepiest_minute

guardId = get_dictMax(sleepiest_minute_db)
print(guardId)
minute = sleepiest_minute_db[guardId]
print(minute)
print(guardId * minute)

