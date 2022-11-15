create table ethereum.blocks
(
    timestamp Int64,
    number Int64,
    hash String,
    parent_hash String,
    nonce String,
    sha3_uncles String,
    logs_bloom String,
    transactions_root String,
    state_root String,
    receipts_root String,
    miner String,
    difficulty Int64,
    total_difficulty Float64,
    size Int64,
    extra_data String,
    gas_limit Int64,
    gas_used Int64,
    transaction_count Int64,
    base_fee_per_gas Int64
) ENGINE = Memory;

create table token_transfers
(
    token_address String,
    from_address String,
    to_address String,
    value Float64,
    transaction_hash String,
    log_index Int64,
    block_number Int64
) ENGINE = Log;

create table ethereum.transactions
(
    hash String,
    nonce Int64,
    transaction_index Int64,
    from_address String,
    to_address String,
    value String,
    gas Int64,
    gas_price Int64,
    input String,
    receipt_cumulative_gas_used Int64,
    receipt_gas_used Int64,
    receipt_contract_address String,
    receipt_root String,
    receipt_status String,
    block_timestamp Int64,
    block_number Int64,
    block_hash String,
    max_fee_per_gas Int64,
    max_priority_fee_per_gas Int64,
    transaction_type Int64,
    receipt_effective_gas_price Int64
)
    engine = Memory;