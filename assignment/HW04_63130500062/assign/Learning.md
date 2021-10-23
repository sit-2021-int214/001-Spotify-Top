## Part 2: Learning function from Tidyverse
## isoband

-  function plot_iso() is a convenience function for debugging and testing.

```
m <- matrix(c(0, 0, 0, 0, 0,
              0, 1, 2, 1, 0,
              0, 1, 2, 0, 0,
              0, 1, 0, 1, 0,
              0, 0, 0, 0, 0), 5, 5, byrow = TRUE)
```
```
plot_iso(m, 0.5, 1.5)
```
## digest
  - function digest() for the creation of hash digests of arbitrary R objects
```
sha1() for numerally stable hashsums,
hmac() for hashed message authentication codes based on a key,
AES() for Advanced Encryption Standard block ciphers.
```


[TransformData](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500062/assign/TransformData.md)
