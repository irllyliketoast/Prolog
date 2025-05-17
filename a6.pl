
% Name: Laura Estremera

%% factorial definition
% Base case: the factorial of 0 is 1
factorial(0,1).
% Recursive case: factorial(N) = N * factorial(N-1)
factorial(N,Result) :- 
    N > 0,              % ensure N is greater than 0
    P is N - 1,         % decrement N to get N-1
    factorial(P,Q),     % recursively call factorial on N-1
    Result is N * Q.    % multiply N with the result of factorial(N-1)

%% bigger definition
% Determines the bigger of two values X and Y, unifying Z with the bigger one
bigger(X,Y,Z):-
    X >= Y,     % if X is greater than or equal to Y
    Z = X.      % then Z is X
bigger(X,Y,Z):-
    Y > X,      % if Y is greater than X
    Z = Y.      % then Z is Y

%% oddSize(List)
% Succeeds if the given list has an odd number of elements
oddSize([_]).  % base case: a single-element list is odd-sized
oddSize([_,_|Tail]) :-  % recursive case: remove two elements and recurse
    oddSize(Tail).

%% evenSize(List)
% Succeeds if the given list has an even number of elements
evenSize([]).  % base case: empty list is even-sized
evenSize([_, _|Tail]):- % recursive case: remove two elements and recurse
    evenSize(Tail).

%% isPrefix(Prefix, List)
% Succeeds if Prefix is a prefix of List
isPrefix([], _). % base case: empty list is a prefix of any list
isPrefix([X|Tail1],[X|Tail2]):- % check heads and recurse on tails
    isPrefix(Tail1, Tail2).

%% remove(Element, List, Result)
% Removes the first occurrence of Element from List to produce Result
remove(_, [], []). % base case: nothing to remove from an empty list
remove(X, [X|Tail], Tail). % found X at head: remove it
remove(X, [Head|Tail], [Head|Tail2]):- % keep head and recurse on tail
    remove(X, Tail, Tail2).

%% isMember(Element, List)
% Checks if Element is in List
isMember(X, [X|_]). % base case: Element is at the head
isMember(X, [_|Z]):- % recursive case: check tail
    isMember(X, Z).

%% isUnion(Set1, Set2, Union)
% Produces Union of Set1 and Set2, avoiding duplicates
isUnion([], [], []). % base case
isUnion(X, [], X).   % nothing to add
isUnion([], Y, Y).
isUnion([H|T], Y, Z) :- 
    isUnion(T, Y, Temp), 
    ( isMember(H, Temp) -> Z = Temp ; Z = [H|Temp] ).


%% isEqual(Set1, Set2)
% Succeeds if Set1 and Set2 have exactly the same elements, regardless of order
isEqual([], []). % base case: two empty sets are equal
isEqual([Head|Tail], X):-
    isMember(Head, X),             % Head must be in X
    remove(Head, X, Tail2),        % remove Head from X
    isEqual(Tail, Tail2).          % recurse on remaining elements

%% isBetween(Start, End, List)
% Succeeds if List contains all numbers between Start and End (exclusive), in order
isBetween(N1, N2, []):- % base case: no numbers between N1 and N2
    N1 >= N2 - 1.
isBetween(N1, N2, [X|Tail]):-
    N1 < N2 - 1,    % ensure there is room between N1 and N2
    X is N1 + 1,    % compute next number after N1
    isBetween(X, N2, Tail). % recurse from X to N2

%% blend(List1, List2, Result)
% Interleaves elements of List1 and List2 into Result
blend([], [], []). % base case: two empty lists blend into empty list
blend(X, [], X).   % if second list is empty, return first
blend([], X, X).   % if first list is empty, return second
blend([X|TailX], [Y|TailY], [X, Y|Z]):- % take one from each and recurse
    blend(TailX, TailY, Z).


%
%!  ADD YOUR CODE ABOVE
%!  ADD YOUR CODE ABOVE
%!
%!  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%%  MAKE NO CHANGES BELOW
%% Unit tests for Prolog Assignment 1
%!  %%%%%%%%
%
%

cls :- write('\33\[2J').


%% factorial
:- begin_tests(factorial).
test(factorial_test1,[true]) :- once(factorial(0, 1)).
test(factorial_test2) :- once(factorial(6,720)).
:- end_tests(factorial).

%%  max
:- begin_tests(bigger).
test(max_test1) :- once(bigger(4,2,4)).
test(max_test2) :- once(bigger(2,12,12)).
:- end_tests(bigger).

/* oddSize */
:- begin_tests(oddSize).
test(oddSize_test1) :- once(oddSize([13,21,2,101,205,9,3])).
test(oddSize_test2) :- once(oddSize([101])).
test(oddSize_test3) :- once(oddSize(['apple','ball','cat'])).
test(oddSize_test4, [fail]) :-oddSize([13,21,2,11]).
:- end_tests(oddSize).

/* evenSize */
:- begin_tests(evenSize).
test(evenSize_test1) :- once(evenSize([13,21,2,101,205,9])).
test(evenSize_test2) :- once(evenSize([])).
test(evenSize_test3) :- once(evenSize(['apple','ball','cat','dog'])).
test(evenSize_test4, [fail]) :- evenSize([13,21,2,11,82]).
:- end_tests(evenSize).

/* prefix */
:- begin_tests(isPrefix).
test(prefix_test1) :- once(isPrefix([1,2], [1,2,3,4,5])).
test(prefix_test2) :- once(isPrefix([1,2,3,4], [1,2,3,4,5])).
test(prefix_test3) :- once(isPrefix([], [1,2,3,4,5])).
test(prefix_test4,all(X==[[],[1],[1,2],[1,2,3]])) :- isPrefix(X, [1,2,3]).
test(prefix_test5, [fail]) :- isPrefix([1,2], [1,3,2,4,5]).
:- end_tests(isPrefix).

/* isBetween */
:- begin_tests(isBetween).
test(isBetween_test1) :- once(isBetween(3, 8, [4,5,6,7])).
test(isBetween_test2) :- once(isBetween(2, 9, [3,4,5,6,7,8])).
test(isBetween_test3) :- once(isBetween(1, 2, [])).
test(isBetween_test4,[fail]) :- isBetween(2, 7, [4,5,6,7]).
:- end_tests(isBetween).

/* isMember */
:- begin_tests(isMember).
test(isMember1) :- once(isMember(1, [1,2,3,4,5])).
test(isMember2) :- once(isMember(4, [1,2,13,4,5,16,7])).
test(isMember3) :- once(isMember(5, [11,21,13,41,5])).
test(isMember4, all(X==[1,2,3,20])) :- isMember(X, [1,2,3,20]).
test(isMember5, [fail]) :- isMember(100, [1,2,3,6]).
:- end_tests(isMember).

/* isUnion */
:- begin_tests(isUnion).
test(isUnion_test1) :- isUnion([3,1,2],[4,1,5,14],X), sort(X, [1,2,3,4,5,14]).
test(isUnion_test2) :- isUnion([2,1,3,4],[4,1,2,3],X), sort(X, [1,2,3,4]).
test(isUnion_test3) :- isUnion([4,2,6],[13,7,11],X), sort(X, [2,4,6,7,11,13]).
:- end_tests(isUnion).

/* isEqual */
:- begin_tests(isEqual).
test(isEqual_test1) :- once(isEqual([3,1,2],[1,2,3])).
test(isEqual_test2,[fail]) :- once(isEqual([3,1,2],[3,1,4])).
test(isEqual_test3) :- once(isEqual([1,2,3,4,5],[5,4,3,2,1])).
test(isEqual_test4) :- once(isEqual(['a','b','c'],['b','c','a'])).
:- end_tests(isEqual).

/* remove */
:- begin_tests(remove).
test(remove_test1) :- once(remove(1, [1,2,3,4], [2,3,4])).
test(remove_test2) :- once(remove(2, [1,1,2,3,2,4], [1,1,3,2,4])).
test(remove_test3) :- once(remove(11, [1,1,2,3,2,4,11], [1,1,2,3,2,4])).
test(remove_test4) :- once(remove(13, [1,1,2,3,2,4,11], [1,1,2,3,2,4,11])).
:- end_tests(remove).


/* blend */
:- begin_tests(blend).
test(blend_test1) :- once(blend([1,2],[3,4],[1,3,2,4])).
test(blend_test2) :- once(blend([1,3,5],[2,4],[1,2,3,4,5])).
test(blend_test3) :- once(blend([1,3],[2,4,6,8],[1,2,3,4,6,8])).
test(blend_test4,X==[1,2]) :- once(blend(X,[3,4],[1,3,2,4])).
test(blend_test5,X==[3,4,5]) :- once(blend([1,2],X,[1,3,2,4,5])).
:- end_tests(blend).


%% The following directives (at the shell prompt ?-) run the tests.
%% run_tests(testName). - runs the corresponding test
%% run_tests. - runs all the tests in the file



















