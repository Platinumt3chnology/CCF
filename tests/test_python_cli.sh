#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache 2.0 License.
set -ex

# This only checks that the following commands do not throw errors.
# It is expected that other tests cover correctness of the generated
# proposals, this just checks the basic usability of the CLI.

keygenerator.sh --help
keygenerator.sh --name alice
keygenerator.sh --name bob --gen-enc-key


python -m ccf.proposal_generator --help

python -m ccf.proposal_generator new_member --help
python -m ccf.proposal_generator new_member bob_cert.pem bob_enc_pubk.pem

python -m ccf.proposal_generator new_user --help
python -m ccf.proposal_generator new_user alice_cert.pem
python -m ccf.proposal_generator new_user alice_cert.pem '"ADMIN"'
python -m ccf.proposal_generator new_user alice_cert.pem '{"type": "ADMIN", "friendlyName": "Alice"}'

python -m ccf.proposal_generator open_network --help
python -m ccf.proposal_generator open_network

python -m ccf.proposal_generator trust_node --help
python -m ccf.proposal_generator trust_node 42

python -m ccf.proposal_generator new_node_code --help
python -m ccf.proposal_generator new_node_code 1234abcd

python -m ccf.proposal_generator accept_recovery --help
python -m ccf.proposal_generator accept_recovery
