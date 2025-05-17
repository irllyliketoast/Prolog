# Prolog Assignment - Predicate Practice (`a6.pl`)

## Overview

This assignment involves implementing a series of Prolog predicates that reinforce recursive thinking and list processing skills, primarily focusing on concepts introduced in Chapter 19. All predicates must be implemented within the provided `a6.pl` file and must **not** use any built-in Prolog predicates unless explicitly allowed.

The file already contains **unit tests** to validate your implementations. These tests must be run to verify correctness before submission.

---

## Getting Started

### 1. File Setup

- **Download** the provided file: `a6.pl`
- **Do not** rename this file. You will be adding all your predicates directly into it.
- Use your Prolog IDE (e.g., SWI-Prolog) to open `a6.pl`.

---

## Compilation and Testing

### To Compile:

- After editing, use:  
  `Compile > Compile Buffer`
- If changes are not reflected when running tests, instead use:  
  `Compile > Make`

### To Run Tests:

- Run all unit tests:  

## Problems to Solve

Below are the predicates you must implement. For each, provide **clear, detailed comments** explaining:

* The **base case**
* The **recursive case**
* How the predicate works conceptually

> ⚠️ **No use of built-in Prolog predicates** is allowed unless specified. Violations will result in **zero credit**.

### Required Predicates

1. **oddSize(List)**
   True if the list has an odd number of elements.

2. **evenSize(List)**
   True if the list has an even number of elements.

3. **isPrefix(Prefix, List)**
   True if `Prefix` is a leading segment of `List`.

4. **isMember(X, List)**
   True if element `X` appears in `List`.

5. **remove(X, Y, Z)**
   True if `Z` is the result of removing the **first instance** of `X` from `Y`.

6. **isUnion(L1, L2, L3)**
   True if `L3` is the union of `L1` and `L2` with **no duplicates**.

7. **isEqual(L1, L2)**
   True if `L1` and `L2` contain the same elements in the same order.

8. **isBetween(N1, N2, X)**
   True if `X` is a list of integers strictly between `N1` and `N2`.
   Example: `isBetween(3, 8, X)` yields `X = [4,5,6,7]`

9. **blend(X, Y, Z)**
   True if `Z` is a **blend** of lists `X` and `Y`, where values are selected in **alternating order**.

   Example behaviors:

   * `blend([1,2], [100,200,300,400], [1,100,2,200,300,400])` ✔️
   * `blend([], [100,200], [100,200])` ✔️
   * `blend([1,2], X, [1,3,2,5,6])` should yield `X = [3,5,6]` ✔️

---

## Documentation Requirements

Each predicate must include **comments** that explain:

* What the predicate does
* Its **base case** and **recursive structure**
* Why the logic works

Use the `%` symbol for comments:

```prolog
% isMember(X, List)
% Base case: X is the head of the list.
% Recursive case: Search for X in the tail of the list.
```

---

## Grading Breakdown

| Criteria                    | Points           |
| --------------------------- | ---------------- |
| Passes all tests + comments | 11 per predicate |
| Passes all tests, weak docs | 5 per predicate  |
| Fails tests or no comments  | 0                |

---

## Submission Guidelines

* Only submit the **`a6.pl` file** to Canvas.
* **Do not zip** your submission or upload extra files.

---

## Notes

* Use the `is` operator for arithmetic when needed, e.g., `R is N1 + 1`.
* Your predicates do **not** need to handle unbound inputs unless the problem explicitly requires it.

```
