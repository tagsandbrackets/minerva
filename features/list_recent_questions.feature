Feature: List Recent Questions
  As a User
  I want to list the most recent questions
  In order to read them and answer them if I can

Scenario: 3 Questions
  Given I created the following questions:
    | title               |
    | "Where is my cat?"  |
    | "Where is my dog?"  |
    | "Where is my psp?"  |
  When I list the most recent questions
  Then I should see the following questions:
    | title               |
    | "Where is my psp?"  |
    | "Where is my dog?"  |
    | "Where is my cat?"  |