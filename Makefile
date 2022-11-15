####################################################################################################################
# Setup containers to run

docker-spin-up:
	docker compose up -d

install-ethereum-etl:
	pip3 install ethereum-etl

run-ethereum-etl:
	ethereumetl export_blocks_and_transactions --start-block 15882279 --end-block 15902279 \
    --blocks-output etl_data/blocks.csv --transactions-output etl_data/transactions.csv \
    --provider-uri https://mainnet.infura.io/v3/ef44a62aa4204783b2a8d4358017d20d && \
    ethereumetl export_token_transfers --start-block 15903828 --end-block 15903865 \
    --provider-uri https://mainnet.infura.io/v3/ef44a62aa4204783b2a8d4358017d20d  --batch-size 100 --output etl_data/token_transfers.csv

up: docker-spin-up

down:
	docker compose down