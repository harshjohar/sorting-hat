# Sorting hat
The model which is the heart of this app.

## Questionnaire
1. You usually prefer just doing what you feel like at any given moment instead of planning a particular daily routine.
2. You enjoy watching people argue.
3. You are interested in so many things that you find it difficult to choose what to try next.
4. You like books and movies that make you come up with your own interpretation of the ending.
5. You enjoy participating in group activities.
6. You are prone to worrying that things will take a turn for the worse.
7. Your personal work style is closer to spontaneous bursts of energy than organized and consistent efforts.
8. You know at first glance how someone is feeling.
9. You become bored or lose interest when the discussion gets highly theoretical.
10. You avoid making phone calls.
11. You rarely worry about whether you make a good impression on people you meet.
12. You usually prefer to be around others rather than on your own.
13. You like to have a to-do list for each day.
14. You rarely contemplate the reasons for human existence or the meaning of life.
15. You are still bothered by mistakes that you made a long time ago.


## Answer Format
Range of -3(Strongly Disagree) -- 0 (Neutral) -- +3(Strongly Agree)

## Prediction Classes
- 'G' - Gryffindor
- 'H' - Hufflepuff
- 'R' - Ravenclaw
- 'S' - Slytherin

## Example Code
```python
import pickle
pickled_model = pickle.load(open('Rnd30Model.pkl', 'rb'))

# 1 record
pickled_model.predict([[2, 0, 1, -1, 2, 3, 3, -2, 3, 2, 0, 1, 3, -3, 0]])
# result : 'G'

# multiple records
lst = pickled_model.predict([[2, 0, 1, -1, 2, 3, 3, -2, 3, 2, 0, 1, 3, -3, 0], [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]])
lst = list(lst)
# result : ['G','G']


# to know confidence score
pickled_model.predict_proba([[2, 0, 1, -1, 2, 3, 3, -2, 3, 2, 0, 1, 3, -3, 0]])
```
