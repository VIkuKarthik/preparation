BIT MANIPULATION
---


> A Integer has 32 BIT
>
> 00000....111 -> for 7
>
> the last bit will is for Signed (+ve / -ve)
> 
> If the computer wants to store a -ve number it will first convert the bits to 2's complement

---
### Decimal and Binary

7 to the base 10 -> **Decimal** (7<sub>10</sub>) *(every number is in Decimal)*

(111) to the base 2 -> **Binary** (111<sub>10</sub>)

---

### Decimal to Binary

To convert Decimal to Binary **Divide the Number with 2**
until it reaches 1 and get the numbers from the bottom to top,
this way you get a Binary representation


| Divide By        | Number           | Remainder  |
| -----------------|:----------------:| ----------:|
| 2             | 7             | 1             |
| 2             | 3             | 1             |
| 2             | 1             | 1             | 

As from the above table, once the **Number reached 1**, we stop and write the Remainder **from bottom to top** 

---

### Binary to Decimal
> Should start from Right to Left

Get the number and multiply by 2 with the power as index.
For 13, Binary is 1101 to conver to Decimal
```
1   1   0   1               -> Binary Representation
3   2   1   0               -> Index Representation (Right to Left)

1x2**0 + 0x2**1 + 1x2**2 + 1x2**3
1      +   2    +   4    +   8    -> 13 -> Decimal Value
```

#### 1's Complement

To convert a Decimal value to 1's complement
- Convert Decimal to Binary
- Flip all the bits *(flip -> 0 to 1 , 1 to 0)*


#### 2's Complement
To convert a Decimal value to 1's complement
- Figure out the 1's Complement for the givien number
- Add **ONE** to it

---

### OPERATORS

#### AND Operator (&)

All True means True
One False means False

#### OR Operator (|)

One True means True
All False means False

#### XOR Operator (^)
Number of 1's is Odd  then 1(TRUE)
Number of 1's is Even then 0(False)

#### SHIFT Operator (>>) and (<<)

##### Right Shift
**Move the Right bit OFF and shift the previous bit to first**

*Formula to get the value:*
```
x >> k = (x / 2**k)` |  `13 >> 2 = (13 / 2**2)
```

From the binary if right shift of 1 means, first binary *(from right)* will be removed and second bianry digit will be moved to first place. `0...1101 -> 0...0110 (if >> 1)`


##### Left Shift
**Move the Left last bit OFF and shift the next bit to previous**

> While doing a left shit, it should be always within the boundary. if (2**31 - 1) << 1, then it is a overflow, because 

*Formula to get the value:*
```
x << k = (x * 2**k)` |  `13 << 2 = (13 * 2**2)
```

From the binary if left shift of 1 means, last binary *(from right)* will be removed and second last bianry digit will be moved to previous place. `0...1101 -> 0...11010 (if >> 1)`


#### NOT Operator (~)

The NOT Operator has two steps:
1) Flip the bits
2) If it is -ve then convert to 2's complement and store else store as it is


