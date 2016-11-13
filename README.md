# Ansible Role: NEM

An Ansible Role that install NEM standalone on Ubuntu16.04.

For more detail about , see [NEM tutorial list](https://blog.nem.io/nem-tutorial-list/) and [ubuntu installation guide standalone](https://blog.nem.io/ubuntu-installation-guide-standalone/) .

# Requirements

- ansible

# Components

- NEM
- Java 8

# Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    ##
    # nem user
    ##
    nem_user: "nem"
    nem_group: "nem"
    nem_uid: "510"
    nem_gid: "510"

    ##
    # nis default settings
    ##

    nem_shortServerName: "Nis"
    nem_folder: "/var/lib/nem"
    nem_maxThreads: 500
    nem_protocol: http
    nem_host: 127.0.0.1
    nem_httpPort : 7890
    nem_httpsPort: 7891
    nem_websocketPort: 7778
    nem_webContext: ""
    nem_apiContext: ""
    nem_homePath: ""
    nem_shutdownPath: "/shutdown"
    nem_userDosFilter: "true"
    nem_nonAuditedApiPaths: "/heartbeat|/status|/chain/height|/chain/score|/chain/last-block|/chain/hashes-from|/push/transaction|/node/ping|/node/info|/node/extended-info|/node/peer-list/active|/account/get|/account/status|/account/unconfirmedTransactions|/account/transfers/all|/account/get/batch"
    nem_network: mainnet
    nis_shouldAutoBoot: "true"
    nis_shouldAutoHarvestOnBoot: "true"
    nis_additionalHarvesterPrivateKeys: ""
    nis_nodeLimit: 5
    nis_timeSyncNodeLimit: 20
    nis_useBinaryTransport: "true"
    nis_useNetworkTime:  "true"
    nis_ipDetectionMode: "AutoRequired"
    nis_unlockedLimit: 4
    nis_allowedHarvesterAddresses: ""
    nis_maxTransactions: 10000
    nis_maxTransactionsPerBlock: 120
    nis_blockGenerationTargetTime: 60
    nis_blockChainRewriteLimit: 360
    nis_additionalLocalIps: ""
    nis_transactionHashRetentionTime: 36
    nis_optionalFeatures: "TRANSACTION_HASH_LOOKUP"
    nis_blockChainFeatures: "PROOF_OF_IMPORTANCE|WB_TIME_BASED_VESTING"
    nis_delayBlockLoading: "true"

    ##
    # NIS settings for
    ##

    nis_ncc_base_dir: "/var/lib/nem/nix"
    working_dir: "/var/lib/nem"
    nem_version: 0.6.82
    nis_ncc_tgz: "nis-ncc-{{ nem_version }}.tgz"
    nis_ncc_tgz_sha256: 76f702260471cba3c7fdb16c18e884f2b39a169d5bdf621c1e14c272cf6426d7
    nis_mainnet_data: nis5_mainnet-681k.h2.db.zip
    nis_mainnet_data_sha256: a2bbe8719a873f647c8beeb9a38a2aa5cb15bcc39f6e481bde3dc714eecec77a
    servant_version: "0_0_4"
    servant_home: "{{ working_dir }}/servant/{{ servant_version }}"
    servant: "servant_{{ servant_version }}.zip"
    servant_sha256: f7229f39f6f69f615ca01e08f3df99065596593717f304baf35c627f1789894b
    enable_nis: True
    enable_ncc: False
    enable_servant: True
    nis_home: "{{ nis_ncc_base_dir }}/{{ nem_version }}/package/nis"
    ncc_home: "{{ nis_ncc_base_dir }}/{{ nem_version }}/package/ncc"

    ##
    # supernode
    ##

    nem_bootName:
    delegate_private_key:

# Example Playbook

simple setup

    > mkdir ops/{inventories,roles,ymls}
    > git clone git@github.com:ethersecurity/ansible-role-nem.git ops/roles/nem
    > cd ops
    > ( edit inventories/example.yml as following)
    > ( edit ymls/example.yml as following)
    > ansible-playbook -i inventories/example.yml ymls/exapmle.yml --ask-become-pass

## Playbook Explanation

files and directories arrangement

    .
    ├── inventories/
    │   └── example.yml
    ├── roles/
    │   └── nem
    └── ymls/
        └── example.yml

inside `ymls/example.yml`

    - hosts: prd-node
      become: True
      roles:
        - roles/nem

inside `inventories/example.yml`

`example-001` and `example-002` are the target server names.

    [prd-node]
    example-001
    example-002

    [production:children]
    prd-node

if you want to create [supernodes](https://blog.nem.io/supernodes/), set 3 variables as following.

    [prd-node]
    example-001 nis_bootName="NODE NAME 1" nem_host="PUBLICK IP or DNS RECORD 1" delegate_private_key="DELEGATE PRIVATE KEY 1"
    example-002 nis_bootName="NODE NAME 2" nem_host="PUBLICK IP or DNS RECORD 2" delegate_private_key="DELEGATE PRIVATE KEY 2"

    [production:children]
    prd-node

setup node with ansible-playbook

    ansible-playbook -i inventories/example.yml ymls/exapmle.yml --ask-become-pass


# start/stop scripts

The start/stop scripts are basically handled via systemd.

nis start/stop scripts

    # start nis
    (@example-001)% sudo service nis start

    # stop nis
    (@example-001)% sudo service nis stop

ncc start/stop scripts

    # start ncc
    (@example-001)% sudo service ncc start

    # stop ncc
    (@example-001)% sudo service ncc stop

servant start/stop scripts

    # start servant
    (@example-001)% sudo service servant start

    # stop servant
    (@example-001)% sudo service servant stop

# License

MIT

# How to Contribute

Send a pull request and bug the maintainer until it gets merged and published.

Make sure to add yourself to [AUTHORS](AUTHORS.md).

# Changelog

## v0.6.82 beta

- Initial release
- NEM verion 0.6.82 beta

