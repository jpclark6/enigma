# Enigma

Enigma was a small project early in my Turing schooling to build an enigma-like encryption algorithm that can read/write to files to encrypt them. I wouldn't trust my credit card data with it, but it's good enough for secret notes.

## Requirements

You will need a recent version of Ruby, and the Minitest gem if you would like to test. 

## Encryption

Create a text file to encrypt, and then run the following command to create a new encrypted file at the desired location.

```
ruby lib/encrypt.rb <file to convert> <encryption file path>
```

Write down the key and encryption date in order to decrypt later.

## Decryption

Run the following command from the terminal to decrypt.

```
ruby lib/decrypt.rb <file to decrypt> <file path for decrypted text> <key> <date>
```

