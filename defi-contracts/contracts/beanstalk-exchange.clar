;; contracts/beanstalk-exchange.clar
(define-constant err-zero-stx (err u200))
(define-constant err-zero-tokens (err u201))

(define-public (provide-liquidity (stx-amount uint) (max-token-amount uint))
  (begin
    (asserts! (> stx-amount u0) err-zero-stx)
    (asserts! (> max-token-amount u0) err-zero-tokens)

    ;; send STX from tx-sender to the contract
    (try! (stx-transfer? stx-amount tx-sender (as-contract tx-sender)))
    ;; send tokens from tx-sender to the contract
    (contract-call? .magic-beans transfer max-token-amount tx-sender (as-contract tx-sender))
  )
)