# SourceConflictResolver test notes

All tests were executed through the deployed GenLayer Studio contract.

## 1. BOTH_COMPATIBLE

Claim:

`example.com is reserved for documentation and illustrative examples.`

Source A:
`https://example.com/`

Source B:
`https://www.iana.org/domains/reserved`

Observed:

- decision: **BOTH_COMPATIBLE**
- confidence: **95**

## 2. SOURCE_A_STRONGER

Claim:

`IANA maintains the example domains for documentation purposes.`

Source A:
`https://www.iana.org/domains/reserved`

Source B:
`https://example.com/`

Observed:

- decision: **SOURCE_A_STRONGER**
- confidence: **90**

## 3. SOURCE_B_STRONGER

Same claim, with the sources reversed.

Observed:

- decision: **SOURCE_B_STRONGER**
- confidence: **95**

## 4. UNRESOLVED

Claim:

`The maintainer of example.com owns a pet cat named Luna.`

Source A:
`https://example.com/`

Source B:
`https://www.iana.org/domains/reserved`

Observed:

- decision: **UNRESOLVED**
- confidence: **95**

## Coverage

The contract's resolution counter reached **4**, covering all four semantic branches in a single deployed instance.
